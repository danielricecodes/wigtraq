class CreateBucks < ActiveRecord::Migration
  def self.up
    create_table :bucks do |t|
      t.date :award_date
      t.text :reason
      t.integer :amount
      t.references :manager
      t.references :employee
      t.timestamps
    end
  end
  
  def self.down
    drop_table :bucks
  end
end
