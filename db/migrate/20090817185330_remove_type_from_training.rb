class RemoveTypeFromTraining < ActiveRecord::Migration
  def self.up
    rename_column :trainings, :type, :brand
  end

  def self.down
    rename_column :trainings, :brand, :type
  end
end
