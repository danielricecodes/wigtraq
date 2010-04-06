class AddTrainingHelperColumnsForDataCrunching < ActiveRecord::Migration
  def self.up
    add_column(:trainings, :old_record, :boolean, :default=>false)
    Training.all.each do |t|
      if t.trainingDate < Date.today
        t.update_attribute(:old_record, true)
        puts "Set Record #{t.id} to true"
      end
      
    end
    puts "Done"
  end

  def self.down
    remove_column(:trainings, :old_record)
  end
end
