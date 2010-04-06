class CreateTimeOffs < ActiveRecord::Migration
  def self.up
    create_table :time_offs do |t|
      t.references :employee
      t.date :day
      t.decimal('hours', :precision=>5, :scale=>2, :default=>0)
      t.timestamps
    end
  end
  
  def self.down
    drop_table :time_offs
  end
end
