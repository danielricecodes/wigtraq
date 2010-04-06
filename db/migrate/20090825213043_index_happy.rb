class IndexHappy < ActiveRecord::Migration
  def self.up
    add_index :time_offs, :employee_id
    add_index :availabilities, :employee_id
    add_index :bucks, [:employee_id, :manager_id]
  end

  def self.down   
  end
end
