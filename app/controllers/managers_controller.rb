class ManagersController < ApplicationController
  
  caches_page :index, :show, :new
  
  def index
    @managers = Manager.all
  end
  
  def show
    @manager = Manager.find(params[:id])
  end
  
  def new
    @manager = Manager.new
  end
  
  def create
    @manager = Manager.new(params[:manager])
    if @manager.save
      flash[:notice] = "Successfully created manager."
      expire_page managers_path
      redirect_to managers_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @manager = Manager.find(params[:id])
  end
  
  def update
    @manager = Manager.find(params[:id])
    if @manager.update_attributes(params[:manager])
      flash[:notice] = "Successfully updated manager."
      expire_page manager_path(@manager)
      expire_page managers_path
      redirect_to @manager
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @manager = Manager.find(params[:id])
    unless @manager.employees.count > 0
      #expire_page manager_path(@manager)
      #@manager.destroy      
      flash[:notice] = "Deleting Managers is Currently Disabled."
      redirect_to managers_url
    else
      flash[:error] = "Can not delete #{@manager.name} because there are still employees assigned."
      redirect_to managers_url
    end
  end
end
