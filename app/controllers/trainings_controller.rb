class TrainingsController < ApplicationController

  def index
    #@trainings = Training.all(:include=>:employee).reverse
    @this_week_start = Date.today.beginning_of_week.to_s
    @this_week_end = (Date.today.end_of_week-2.days).to_s
    @last_week_start = 1.week.ago.to_date.beginning_of_week.to_s
    @last_week_end = (1.week.ago.to_date.end_of_week-2.days).to_s
  end
  
  def show
    @training = Training.find(params[:id], :include=>:employee)
  end
  
  def new
    #create an array instead and follow the example
    #this will allow validation to work
    @training_array = Array.new
    @training_array << Training.new
  end  
  
  def create   
    
    #count successful saves
    #push unsuccessful saves into an array (same name as new) and render again.  should retain the data and spit out individualized errors.
    if params[:training].nil?
      flash[:error] = "Don't do that."
      redirect_to trainings_url
    else
      @success = 0
      @failure = 0
      @training_array = Array.new
      Training.transaction do    
        params[:training].each_value do |train|
          train_temp = Training.new(train)
          if train_temp.save
            @success += 1
          else
            @failure += 1
            @training_array << train_temp
          end
        end
      end
      #sets up a notice message if there were successful records saved
      if @success > 0
        flash[:notice] = "Successfully submitted #{@success} records."
      end
      
      #if there was failure, go back to the form, but if there was no failure, go back to the training index.
      if @failure > 0
        flash.now[:error] = "Some records had errors."
        render :action =>'new'
      else
        redirect_to trainings_url
      end
    end 
    
  end  
  
  def add_more_training
    @training = Training.new
    #renders RJS
  end
  
  def edit
    @training = Training.find(params[:id])
  end
  
  def update
    @training = Training.find(params[:id])
    if @training.update_attributes(params[:training])
      expire_fragment(:controller=>'trainings',:action=>'index')
      flash.now[:notice] = "Successfully updated training."
      redirect_to @training
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    expire_fragment(:controller=>'trainings',:action=>'index')
    flash.now[:notice] = "Training Record Deleted"
    redirect_to trainings_url
  end
  
  def list
    
    scope = 1
    @employee = Employee.find(params[:training][:id])
    @trainings = @employee.trainings.find(:all, :order=>'trainingDate')    
    num_weeks = (@trainings.empty? ? 0 : (1+((@trainings.first.trainingDate-@trainings.last.trainingDate).abs.to_i/7)))
    @baseline = scope*num_weeks
  end
  
  def team_list
    flash.now[:warning] = "This report does not contain data for individuals who are no longer with the company."
    @start_date = "#{params[:training]['start_date(1i)']}-#{params[:training]['start_date(2i)']}-#{params[:training]['start_date(3i)']}".to_date
    @end_date = "#{params[:training]['end_date(1i)']}-#{params[:training]['end_date(2i)']}-#{params[:training]['end_date(3i)']}".to_date
    @manager = Manager.find(params[:training][:id])
    scope = @manager.employees.active.included_in_training.count
    @trainings = @manager.employees.collect {|emp| emp.trainings.find(:all, :conditions=>{:trainingDate=>@start_date..@end_date})}.flatten
   
    num_weeks = 1+((@start_date-@end_date).abs.to_i/7)
    @baseline = scope*num_weeks
  end
  
  def list_by_date
    flash.now[:warning] = "This report does not contain data for individuals who are no longer with the company."
    @start_date = params[:training][:start_date].try(:to_date)
    @end_date = params[:training][:end_date].try(:to_date)
    scope = Employee.active.included_in_training.count  #only used for the weekly ad-hoc reports.  Staffing levels don't change enough to merit worrying about this.
    
    if params[:training]['start_date(1i)'] then
      #setup params for 3rd report
      @start_date = "#{params[:training]['start_date(1i)']}-#{params[:training]['start_date(2i)']}-#{params[:training]['start_date(3i)']}".to_date
      @end_date = "#{params[:training]['end_date(1i)']}-#{params[:training]['end_date(2i)']}-#{params[:training]['end_date(3i)']}".to_date
      scope = 1
    end
    # All possible Start Date formatting done, check for nil?
    if params[:dropdown]
      @end_date = @start_date + 4.days
    end
    
    conditions_hash=Hash.new
    conditions_hash.store('trainingDate', @start_date..@end_date)
    if params[:training][:id]
      conditions_hash.store('employee_id', params[:training][:id])
    end
    
    #there has to be a more efficient way to do this, but oh well for now.
    @trainings = Employee.active.included_in_training.collect {|emp| emp.trainings.find(:all, :conditions=>conditions_hash, :include=>:employee)}.flatten
    #@trainings = Training.find(:all, :conditions=>conditions_hash, :include=>:employee)    

    num_weeks = 1+((@start_date-@end_date).abs.to_i/7)

    @baseline = scope*num_weeks
    
  end
end
