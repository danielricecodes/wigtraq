Breadcrumb.configure do
  #individual pages to use in trails
  crumb :root, "Home", :root_path
  crumb :trainings, "Training", :trainings_path
  crumb :training, '#{controller.action_name.capitalize}ing Training ID #{params[:id]}', :training_path, :params=>:id
  crumb :new_training, 'Adding Training', :new_training_path
  crumb :list_training, 'Training for #{@employee.name}', :list_training_path
  crumb :managers, "Managers", :managers_path
  crumb :manager, '#{controller.action_name.capitalize}ing #{@manager.name}', :manager_path
  crumb :new_manager, 'New Manager', :new_manager_path
  crumb :employees, "Employees", :employees_path
  crumb :employee, '#{controller.action_name.capitalize}ing #{@employee.name}', :training_path
  crumb :new_employee, 'New Employee', :new_employee_path
  crumb :options, "Options and Administration", :options_path
  crumb :avails, "Availability", :availabilities_path
  crumb :avail, '#{controller.action_name.capitalize}ing Availability Record ID:#{@availability.id}', :availability_path
  crumb :new_avail, 'Uploading Angel Data', :new_availability_path
  crumb :buck, '#{controller.action_name.capitalize}ing Buck Record ID:#{@buck.id}', :buck_path
  crumb :bucks, 'Bucks', :bucks_path
  crumb :new_buck, 'Adding New Bucks', :new_buck_path
  crumb :time_off, "Time Off Management", :time_offs_path
  crumb :new_time_off, "Add new Time Off", :new_time_off_path
  crumb :edit_time_off, 'Change Time Off for #{@time_off.employee.name}', :edit_time_off_path
  crumb :show_time_off, 'Time Off record for #{@time_off.employee.name}', :time_off_path
  crumb :avail_report, 'Availability Report for #{@start_date} to #{@end_date -1.day}', :report_availability_path
  #what the trail should look like for a given controller and action
  
  
  
  
  trail :application, :frontpage, [:root]
  trail :trainings, :index, [:root, :trainings]
  trail :trainings, [:show, :edit, :update], [:root, :trainings, :training]
  trail :trainings, [:new, :create], [:root, :trainings, :new_training]
  trail :trainings, :list, [:root, :trainings, :list_training]
  trail :options, :index, [:root, :options]
  trail :managers, :index, [:root, :options, :managers]
  trail :managers, [:show, :edit, :update], [:root, :options, :managers, :manager]
  trail :managers, :new, [:root, :options, :managers, :new_manager]
  trail :employees, :index, [:root, :options, :employees]
  trail :employees, [:show, :edit, :update], [:root, :options, :employees, :employee]
  trail :employees, :new, [:root, :options, :employees, :new_employee] 
  trail :availabilities, [:show, :edit, :update], [:root, :avails, :avail]
  trail :availabilities, [:new, :create], [:root, :avails, :new_avail]
  trail :availabilities, [:index, :list, :team_list, :list_by_date], [:root, :avails]
  trail :availabilities, [:report_by_date], [:root, :avails, :avail_report]
  trail :bucks, [:index, :list_by_date], [:root, :bucks]
  trail :bucks, [:show, :edit, :update], [:root, :bucks, :buck]
  trail :bucks, [:new, :create], [:root, :bucks, :new_buck]
  trail :time_offs, [:index], [:root, :avails, :time_off]
  trail :time_offs, [:new, :create], [:root, :avails, :new_time_off]
  trail :time_offs, [:edit, :update], [:root, :avails, :edit_time_off]
  trail :time_offs, [:show], [:root, :avails, :time_off, :show_time_off]
  #delimiter
  delimit_with ' >> '
end