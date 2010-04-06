class TimeOffsController < ApplicationController
  def index
    if params[:last_week]
      @time_offs = TimeOff.last_week.find(:all,:include=>:employee)
    else
      @time_offs = TimeOff.find(:all,:include=>:employee)
    end
    
  end
  
  def show
    @time_off = TimeOff.find(params[:id],:include=>:employee)
  end
  
  def new
    @time_off_array = Array.new
    @time_off_array << TimeOff.new
  end
  
  def create   
    
    #count successful saves
    #push unsuccessful saves into an array (same name as new) and render again.  should retain the data and spit out individualized errors.
    if params[:time_off].nil?
      flash[:error] = "Don't do that."
      redirect_to time_offs_url
    else
      @success = 0
      @failure = 0
      @time_off_array = Array.new
      TimeOff.transaction do    
        params[:time_off].each_value do |train|
          train_temp = TimeOff.new(train)
          if train_temp.save
            @success += 1
          else
            @failure += 1
            @time_off_array << train_temp
          end
        end
      end
      #sets up a notice message if there were successful records saved
      if @success > 0
        flash[:notice] = "Successfully submitted #{@success} records."
      end
      
      #if there was failure, go back to the form, but if there was no failure, go back to the time_off index.
      if @failure > 0
        flash.now[:error] = "Some records had errors."
        render :action =>'new'
      else
        redirect_to time_offs_url
      end
    end 
    
  end  
  
  def add_more_time_off
    @time_off = TimeOff.new
    #renders RJS
  end
  
  def edit
    @time_off = TimeOff.find(params[:id],:include=>:employee)
  end
  
  def update
    @time_off = TimeOff.find(params[:id],:include=>:employee)
    if @time_off.update_attributes(params[:time_off])
      flash[:notice] = "Successfully updated time off."
      redirect_to time_offs_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @time_off = TimeOff.find(params[:id])
    @time_off.destroy
    flash[:notice] = "Successfully deleted time off."
    redirect_to time_offs_url
  end
  
  def add_holiday
    @employees = Employee.active
    @employees.each do |employee|
      temp = params[:time_off]
      temp[:employee] = employee
      temp[:hours] = 9.0
      TimeOff.new(temp).save
    end
    flash[:notice] = "Day Off Added"
    redirect_to time_offs_url
  end
  
  def add_full_week
    emp = Employee.find(params[:time_off][:id])
    start = "#{params[:time_off]['start_date(1i)']}-#{params[:time_off]['start_date(2i)']}-#{params[:time_off]['start_date(3i)']}".to_date.beginning_of_week
    for i in 0..4 
       emp.time_offs.build(:reason=>"Vacation Time", :day=>(start+i.days), :hours=>9).save
    end
   flash[:notice] = "Full Week of Vacation added for #{emp.name} between #{start} and #{start+4.days}"
   redirect_to time_offs_url
  end
end
