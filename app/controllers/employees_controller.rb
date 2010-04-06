class EmployeesController < ApplicationController
  
  caches_page :index, :show, :new
  
  def index
    @employees = Employee.find(:all, :include=>:manager)
  end
  
  def show
    @employee = Employee.find(params[:id])
  end
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      flash[:notice] = "Successfully created employee."
      expire_page employees_path
      redirect_to employees_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      flash[:notice] = "Successfully updated employee."
      expire_page employee_path(@employee)
      expire_page employees_path
      redirect_to employees_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    #@employee.destroy
    expire_page employee_path(@employee)
    flash[:notice] = "Successfully skipped deleting this record for now."
    redirect_to employees_url
  end
end
