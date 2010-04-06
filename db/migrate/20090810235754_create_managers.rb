class CreateManagers < ActiveRecord::Migration
  def self.up
    change_table :managers do |t|
      t.timestamps
    end
  end

  def self.down
    
  end
end
