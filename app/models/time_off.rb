class TimeOff < ActiveRecord::Base
  belongs_to :employee
  
  validates_presence_of :hours, :reason
  validates_numericality_of :hours, :greater_than=>0, :less_than_or_equal_to=>9.0
  
  before_save :fix_time
  default_scope :order=>'day desc'
  named_scope :last_week, :conditions=>{:day=>((1.week.ago.beginning_of_week)..(1.week.ago.end_of_week)-2.days)}
  
  def fix_time
    self.hours = self.hours.to_f / 9.0 * 6.75
  end
  
  def pretty_hours
    return self.hours.to_f / 6.75 * 9.0
  end
end
