class UpdateFieldsForEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.boolean 'included_in_training', :default=>true, :null=>false
      t.boolean 'included_in_availability', :default=>true, :null=>false
    end
  end

  def self.down
  end
end
