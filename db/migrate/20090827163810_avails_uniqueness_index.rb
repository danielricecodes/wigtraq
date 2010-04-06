class AvailsUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :availabilities, [:event_duration, :employee_id, :event_type, :event_date], :unique=>true, :name=>'availability_uniqueness_contraint'
  end

  def self.down
    remove_index :availabilities, :name=>'availability_uniqueness_contraint'
  end
end
