class Buck < ActiveRecord::Base
  belongs_to :employee
  belongs_to :manager
  
  validates_numericality_of :amount, :greater_than => 0, :less_than => 100, :only_integer=>true, :message=>'is not a whole number', :unless=>Proc.new {|train| train.amount.blank?}
  validates_presence_of :amount, :reason
  
  #symbols can't have numbers as the first digit, so 2H_2009 => twoh_2009
  #it would be better to make this more fluid and not hard coded, like Salesforce.com.
  named_scope :twoh_2009, :conditions=>{:award_date=>("2009-07-01".to_date)..("2009-12-31".to_date)}
  named_scope :oneh_2010, :conditions=>{:award_date=>("2010-01-01".to_date)..("2010-06-30".to_date)}
  named_scope :twoh_2010, :conditions=>{:award_date=>("2010-07-01".to_date)..("2010-12-31".to_date)}
  named_scope :last_week, :conditions=>{:award_date=>((1.week.ago.beginning_of_week)..(1.week.ago.end_of_week)-2.days)}

end
