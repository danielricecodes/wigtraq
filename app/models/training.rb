class Training < ActiveRecord::Base
  belongs_to :employee
  acts_as_list :scope => :employee
  #default_scope :order=>:trainingDate  
  
  validates_presence_of :hours_trained, :description
  validates_numericality_of :hours_trained, :greater_than => 0, :less_than => 24, :unless=>Proc.new {|train| train.hours_trained.blank?}
  
  #delete eventually, for now needed to work properly
  def employee_rake
    read_attribute(:employee).to_s
  end
  
  def display_name
    self.brand
  end
  
  def self.total_hours(array=[])
    total = 0.0
    array.each do |a|
      total = total + a.hours_trained
    end
    total
  end
  
  def <=>(train)
    hours_trained <=> train.hours_trained    
  end
 
end
