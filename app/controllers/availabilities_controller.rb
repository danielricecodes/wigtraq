class AvailabilitiesController < ApplicationController
  require 'fastercsv'
  def index
    #show reports
    @this_week_start = Date.today.beginning_of_week.to_s
    @this_week_end = (Date.today.end_of_week-2.days).to_s
    @last_week_start = 1.week.ago.to_date.beginning_of_week.to_s
    @last_week_end = (1.week.ago.to_date.end_of_week-2.days).to_s
  end  
  
  def show
    @availability = Availability.find(params[:id])
  end
  
  def new
    @availability = Availability.new
  end
  
  def create
    #process this in a transaction, prevents partial uploads in case of an error
    ignored_rows = 0    
    Availability.transaction do 
      begin
        2.times do |i|
          data_set = params[:availability]["uploaded_data#{i+1}".to_sym]
          if data_set.nil? then
            flash[:warning] = "No file found for Tier #{i+1}"
          else
          FasterCSV.parse(data_set, :headers=>true) do |row|          
             emp = Employee.find_by_angel_name(row[3])
             if emp then
               #first check that records don't already exist with the current timestamp to prevent duplication.
               #CODE STORAGE: --- .chop.reverse.chop.reverse
               begin
                 #TODO: do quote sanity check here.
                 Availability.new(:employee_id=>emp.id, 
                                  :event_date=>"#{row[0].delete("\"")} #{row[1]}".to_time(:local).utc.to_s(:db),
                                  :event_type=>row[4],
                                  :event_duration=>row[2]).save
               rescue ActiveRecord::StatementInvalid
                 ignored_rows += 1
                 #do nothing, this record has already been uploaded and the uniqueness constraint on the db is rejecting duplicate records.
               end
             end         
          end
          end
        end
        expire_fragment(:controller=>'availabilties',:action=>'index')
        flash[:notice] = "CSV file uploaded successfully.  There were #{ignored_rows} rows ignored."
        redirect_to availabilities_url
      rescue FasterCSV::MalformedCSVError
        flash[:error] = "There was a problem parsing the CSV file.  Please ensure its integrity and try again."
        redirect_to availabilities_url
      rescue ArgumentError
        flash[:error] = "MEGAFAIL: Please let Dan and/or Josh know."
        redirect_to availabilities_url 
      rescue NoMethodError
        flash[:error] = "You did not select at least 1 file to upload."
        redirect_to availabilities_url
      end 
    end 
  end
  
  def edit
    @availability = Availability.find(params[:id])
  end
  
  def update
    @availability = Availability.find(params[:id])
    if @availability.update_attributes(params[:availability])
      flash[:notice] = "Successfully updated availability."
      redirect_to @availability
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @availability = Availability.find(params[:id])
    #@availability.destroy
    flash[:error] = "Deleting disabled temporarily."
    redirect_to availabilities_url
  end
  
  def bulk_destroy
    start_date = "#{params[:availability]['start_date(1i)']}-#{params[:availability]['start_date(2i)']}-#{params[:availability]['start_date(3i)']}".to_date
    end_date = "#{params[:availability]['end_date(1i)']}-#{params[:availability]['end_date(2i)']}-#{params[:availability]['end_date(3i)']}".to_date
    Availability.transaction do
      holder = Availability.find_all_by_event_date(start_date..end_date).collect {|record| record.id}
      Availability.destroy(holder)
      flash[:notice] = "Successfully Removed #{holder.length} records."
      redirect_to availabilities_url
    end
  end
  
  def list_by_date

    @start_date = params[:availability][:start_date].try(:to_date)
    @end_date = params[:availability][:end_date].try(:to_date)
    if params[:availability]['start_date(1i)'] then
      @start_date = "#{params[:availability]['start_date(1i)']}-#{params[:availability]['start_date(2i)']}-#{params[:availability]['start_date(3i)']}".to_date
      @end_date = "#{params[:availability]['end_date(1i)']}-#{params[:availability]['end_date(2i)']}-#{params[:availability]['end_date(3i)']}".to_date
    end
    if @start_date || @end_date
      conditions_hash=Hash.new
      conditions_hash.store('availabilities.event_date', @start_date..@end_date)
      conditions_hash.store('employees.included_in_availability', true)
      if params[:availability][:id]
        conditions_hash.store('employee_id', params[:availability][:id])
      end
      @records = Availability.find(:all, :conditions=>conditions_hash, :joins=>:employee, :order=>'employees.name, event_date', :select=>'availabilities.*, employees.name, employees.included_in_availability')
      flash[:notice] = "Records found successfully."
      render :action=>'list_by_date'
    else
      flash[:error] = "A date range must be specified with a form to use this URL."
      redirect_to availabilities_url
    end
    
  end
  
  def report_by_date
    daily = false
    #can be weekly, or paz's daily.  check for this here.
    if params[:availability][:mode] == 'weekly'
      @start_date = params[:availability][:start_date].try(:to_date)
      @end_date = @start_date + 5.days
      @employees = Employee.active.included_in_availability
    elsif params[:availability][:mode] == 'daily'
      @start_date = "#{params[:availability]['start_date(1i)']}-#{params[:availability]['start_date(2i)']}-#{params[:availability]['start_date(3i)']}".to_time(:local).utc
      @end_date = @start_date+1.day
      case params[:availability][:emp_type]
        when "TSE"
          @employees = Employee.active.tse.included_in_availability
        when "CSR"
          @employees = Employee.active.csr.included_in_availability
      end      
      daily = true
    end
    
    #calculate and grab records
    @employees_count = @employees.length
    @show = true    
    @displayhash = []
    @total_perc = 0
    @employees.each do |record|
      timeHash = record.returnTimeHash(@start_date,@end_date)
      adjust = record.getTimeOff(@start_date.to_date,@end_date.to_date,daily)
      if adjust[:hours_worked] <= 0
        @displayhash << {:employee_name=>record.name,:timeHash=>timeHash,:adjust=>adjust,:finalperc=>"Vacation Day", :color=>'grey_bg'}
        @employees_count -= 1
      else
        finalperc = (timeHash[:avail]/(adjust[:hours_worked]*36)).round
        color = ''
        case finalperc
          when 100 .. 200
            color = 'green_bg'
          when 90 ... 100
            color = 'yellow_bg'
          else
            color = 'red_bg'
        end    
        @displayhash << {:employee_name=>record.name,:timeHash=>timeHash,:adjust=>adjust,:finalperc=>finalperc, :color => color}
        @total_perc += finalperc
      end
      
      
   end
   @total_perc = @total_perc / @employees_count
   if @total_perc == 0 
     flash[:error] = "It appears no records have been uploaded yet"
     @show = false
   end
 end
 
 def report_daily_team
   @show = false
   @start_date = "#{params[:availability]['start_date(1i)']}-#{params[:availability]['start_date(2i)']}-#{params[:availability]['start_date(3i)']}".to_time(:local).utc
   @end_date = @start_date+1.day
   @records = Availability.find(:all, :conditions=>{:event_date=>@start_date..@end_date, :employee_id=>Manager.find(params[:availability][:manager_id]).employee_ids}, :include=>:employee)
      
   @displayhash = []
   @total_perc = 0
   render :action=>'report_by_date'
 end
end
