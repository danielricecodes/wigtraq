class Manager < ActiveRecord::Base
  has_many :employees
  has_many :bucks
  validates_presence_of :name
  
  named_scope :active, :conditions=>{:active_bool=>true}
end
