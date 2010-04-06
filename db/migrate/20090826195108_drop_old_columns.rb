class DropOldColumns < ActiveRecord::Migration
  def self.up
    remove_columns :employees, :manager, :active
    #drop_table :kudos
    remove_column :managers, :active
    remove_columns :trainings, :techHours, :techDescription, :prodHours, :prodDescription, :softHours, :softDescription, :old_record
  end

  def self.down
    raise IrreversibleMigrationError
  end
end
