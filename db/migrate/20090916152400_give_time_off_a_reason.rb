class GiveTimeOffAReason < ActiveRecord::Migration
  def self.up
    add_column(:time_offs, :reason, :text)
  end

  def self.down
    remove_column(:time_offs, :reason)
  end
end
