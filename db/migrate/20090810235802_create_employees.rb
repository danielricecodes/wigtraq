class CreateEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.timestamps
    end
  end

  def self.down
    
  end
end
