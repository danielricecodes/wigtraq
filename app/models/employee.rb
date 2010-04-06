class Employee < ActiveRecord::Base
  belongs_to :manager
  has_many :trainings, :order=>'trainingDate', :dependent=>:destroy
  has_many :bucks, :dependent=>:destroy
  has_many :availabilities, :dependent=>:destroy
  has_many :time_offs, :dependent=>:destroy
    
  validates_presence_of :name, :angel_name
  
  named_scope :active, :conditions=>{:active_bool=>true}
  named_scope :included_in_training, :conditions=>{:included_in_training=>true}
  named_scope :included_in_availability, :conditions=>{:included_in_availability=>true}
  named_scope :tse, :conditions=>{:role=>"TSE"}
  named_scope :csr, :conditions=>{:role=>"CSR"}
  
  default_scope :order=>'name'
  
  #temporary for migration
  def manager_rake
    read_attribute(:manager).to_s
  end
  
  def get_initials
    split_name = self.name.split
    split_name.first[0..0].capitalize << split_name.last[0..2].capitalize
  end
  
#  def itemizeTime(startTime,endTime,goal)
#    objectsinrange = self.availabilities.find_all_by_event_date(startTime..endTime)
#    avail = 0
#    for hit in objectsinrange 
#      sET = hit.event_type
#      if (sET.include?("Click") or sET.include?("OUTBOUND") or sET.include?("Available") or sET.include?("Wrap") or sET.include?("Answered Call"))
#        avail += hit.event_duration
#      end
#    end
#    return (avail/(goal*36)).round
#  end
  
  def returnTimeHash(startTime,endTime)
    dataHash = {:idle=>0,:away=>0,:answered=>0,:incoming=>0,:outgoing=>0,:wrapup=>0, :avail=>0}
    objectsinrange = self.availabilities.find_all_by_event_date(startTime..endTime, :select=>'event_type,event_duration')
    for hit in objectsinrange
      sET = hit.event_type
      sED = hit.event_duration
      if (sET.include?("Click") or sET.include?("OUTBOUND")) then dataHash[:outgoing] += sED end
      if (sET.include?("Available")) then dataHash[:idle] += sED end
      if (sET.include?("Wrap")) then dataHash[:wrapup] += sED end
      if (sET.include?("Answered")) 
        dataHash[:incoming] += sED
        dataHash[:answered] += 1
      end
      if (sET.include?("Away")) then dataHash[:away] += sED unless (sET.include?("Click") or sET.include?("OUTBOUND")) end 
    end
    dataHash[:avail] = dataHash[:idle] + dataHash[:incoming] + dataHash[:outgoing] + dataHash[:wrapup]
    return dataHash
  end
  
  def getTimeOff(startTime,endTime,daily=nil)
    if daily 
      objectsinrange = self.time_offs.find_all_by_day(startTime)
    else
      objectsinrange = self.time_offs.find_all_by_day(startTime..endTime)
    end
    hours_off = 0
    day_shift = 0
    day_span = (endTime - startTime).to_i
    for hit in objectsinrange
      hours_off += hit.hours
      day_shift += hit.hours/6.75
    end
    return {:days_worked=>day_span - day_shift,:hours_worked=>(day_span*6.75)-hours_off}
  end
  
end
