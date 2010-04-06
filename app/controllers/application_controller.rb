# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ExceptionLoggable
  
  helper :all # include all helpers, all the time
  helper :breadcrumbs
  
  #disabling since its overkill for this app and its causing weird form errors when reporting on Availability
  #protect_from_forgery :only=>[:create, :update, :destroy]
  
  
  layout 'main'
  
  caches_page :frontpage  
  def frontpage 
    @bucks_array = Employee.active.included_in_training.collect {|e| [(e.get_initials), e.bucks.twoh_2009.count]}.to_json.chop.reverse.chop.reverse
            
    most_training_last_week = Training.find(:all, :select=>'sum(hours_trained) as `hours_trained`, trainings.employee_id as `employee_id`, employees.name as `name`', :conditions=>{:trainingDate=>(1.week.ago.beginning_of_week)..(1.week.ago.end_of_week)-2.days}, :group=>'employee_id', :joins=>:employee).max
    @training_winner = most_training_last_week.name unless most_training_last_week.nil?
    @training_winner_hours = most_training_last_week.hours_trained.to_f unless most_training_last_week.nil?
    #raise Error("Boom!")
    #renders app/view/application/frontpage.html.erb
  end
  
  def expire_frontpage_ajax
    expire_page "/"    
    #fancy javascript update code to tell the browser to refresh the current page!
    render :update do |page| page << 'window.location.reload()' end
  end
  
  private 
  def local_request?
    false
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
