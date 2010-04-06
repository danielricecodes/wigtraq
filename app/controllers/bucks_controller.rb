class BucksController < ApplicationController
  #reporting even needed here?
  def index
    @this_week_start = Date.today.beginning_of_week.to_s
    @this_week_end = (Date.today.end_of_week-2.days).to_s
    @last_week_start = 1.week.ago.to_date.beginning_of_week.to_s
    @last_week_end = (1.week.ago.to_date.end_of_week-2.days).to_s
  end
  
  def show
    @buck = Buck.find(params[:id], :include=>[:manager, :employee])
  end
  
  def new
    @buck_array = Array.new
    @buck_array << Buck.new
  end
  
  def create
    if params[:buck].nil?
      flash[:error] = "Don't do that."
      redirect_to bucks_url
    else
      @success = 0
      @failure = 0
      @buck_array = Array.new
      Buck.transaction do    
        params[:buck].each_value do |train|
          train_temp = Buck.new(train)
          if train_temp.save
            @success += 1
          else
            @failure += 1
            @buck_array << train_temp
          end
        end
      end
      #sets up a notice message if there were successful records saved
      if @success > 0
        flash[:notice] = "Successfully submitted #{@success} Bucks."
      end
      
      #if there was failure, go back to the form, but if there was no failure, go back to the buck index.
      if @failure > 0
        flash.now[:error] = "Some records had errors."
        render :action =>'new'
      else
        redirect_to bucks_url
      end
    end 
  end
  
  def add_more_bucks
    @buck = Buck.new
    #renders RJS
  end
  
  def edit
    @buck = Buck.find(params[:id])
  end
  
  def update
    @buck = Buck.find(params[:id])
    if @buck.update_attributes(params[:buck])
      flash[:notice] = "Successfully updated buck."
      redirect_to @buck
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    #@buck = Buck.find(params[:id])
    #@buck.destroy
    flash[:error] = "Deleting Bucks is currently disabled."
    redirect_to bucks_url
  end
  
  def list_by_date
    @start_date = params[:buck][:start_date].try(:to_date)
    @end_date = params[:buck][:end_date].try(:to_date)
        
    if params[:buck]['start_date(1i)'] then      
      @start_date = "#{params[:buck]['start_date(1i)']}-#{params[:buck]['start_date(2i)']}-#{params[:buck]['start_date(3i)']}".to_date
      @end_date = "#{params[:buck]['end_date(1i)']}-#{params[:buck]['end_date(2i)']}-#{params[:buck]['end_date(3i)']}".to_date      
    end
    conditions_hash=Hash.new
    conditions_hash.store('award_date', @start_date..@end_date)
    if params[:buck][:id]
      conditions_hash.store('employee_id', params[:buck][:id])
    end
    @bucks = Buck.find(:all, :conditions=>conditions_hash, :include=>[:employee, :manager])   
  end

end
