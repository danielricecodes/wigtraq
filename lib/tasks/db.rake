#Execute these in order to successfully refactor the data in the database
#database must be migrated first

namespace :db do
  desc "Generate foreign keys for employee table"
  task :foreign_key_employee => :environment do
        
    Employee.find(:all).each do |emp|      
      if emp.manager_id.nil? or emp.manager_id == 0
        puts "Adding Manager for #{emp.name}"
        man = Manager.find_by_name(emp.manager_rake)
        emp.manager = man
        puts "Added #{man.name} for #{emp.name}"
      end
      puts "Updating Active Status"
      case emp.active
          when 'N'
            emp.active_bool = false
          when 'Y'
            emp.active_bool = true
      end
      
      emp.save(false)
      puts "#{emp.name} saved successfully."
      puts '***</employee>***'
    end
  end
  
  desc "Generate foreign keys for training records"
  task :foreign_key_training => :environment do
    Training.all.each do |train|
      puts "Setting training for record #{train.id}}..."
      if train.employee_id.nil? or train.employee_id == 0
        train.employee = Employee.find_by_name(train.employee_rake)
      end
      train.save(false)
      puts '***</training>***'
    end
  end
  desc 'Update position column for training records'
  task :position_training => :environment do
    puts "Setting acts_as_list ordering"
    Employee.all.each do |emp|
      emp.trainings.each_with_index {|tr, pos| tr.position=pos+1; tr.save(false)} 
    end
    #validates this function until employee column is dropped
    #select count(*), max(position), employee from trainings group by employee
    #all rows should be show equal calculations
  end
  
  desc 'Corrects training records'
  task :records_training => :environment do
    puts "Correcting old training records"    
    Training.find_all_by_old_record(true).each do |t|
      if t.techHours > 0
        Training.new(:brand=>'Technical',:employee_id=>t.employee_id, :trainingDate=>t.trainingDate, :hours_trained=>t.techHours.to_f, :description=>t.techDescription).save
        puts "Saved Technical Training Record."
      end
      if t.softHours > 0
        Training.new(:brand=>'Soft Skills',:employee_id=>t.employee_id, :trainingDate=>t.trainingDate, :hours_trained=>t.softHours.to_f, :description=>t.softDescription).save
        puts "Saved Soft Skill Record."
      end
      if t.prodHours > 0
        Training.new(:brand=>'Product',:employee_id=>t.employee_id, :trainingDate=>t.trainingDate, :hours_trained=>t.prodHours.to_f, :description=>t.prodDescription).save
        puts "Saved Product Training Record."
      end      
    end
    
    puts "Done"
  end
  
  desc 'Delete old and incorrect training records'
  task :purge_old_training_records => :environment do
    #gets rid of records flagged as old
    Training.destroy(Training.find_all_by_old_record(true).collect {|r| r.id})
    #gets rid of old records saved in the future
    Training.find(:all, :conditions=>["trainingDate > ?", Date.today.to_s(:db)]).each do |t|
      t.destroy
    end
  end
  
#  desc 'Migrate Kudos to Bucks'
#  task :migrate_kudos_to_bucks => :environment do
#    Kudo.transaction do
#      Kudo.all.each do |kudo|
#        emp = Employee.find_by_name(kudo.employee)
#        if emp
#          Buck.new(:employee_id=>emp.id,
#                   :award_date=>kudo.kudodate,
#                   :amount=>kudo.bucks,
#                   :reason=>kudo.kudos,
#                   :manager_id=>emp.manager.id).save
#        end
#        
#      end
#    end
#  end
end