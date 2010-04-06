class UpdateAvailabilityAndEmployees < ActiveRecord::Migration
  def self.up
    remove_column :availabilities, :percentage
    remove_column :availabilities, :available_date
    add_column :availabilities, :event_date, :datetime
    add_column :availabilities, :event_type, :string
    add_column :availabilities, :event_duration, :integer
    add_column :employees, :role, :string
    add_column :employees, :angel_name, :string
  end

  def self.down
    raise IrreversibleMigrationError
  end
end
