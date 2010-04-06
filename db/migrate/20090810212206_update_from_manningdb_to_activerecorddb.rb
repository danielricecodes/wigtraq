class UpdateFromManningdbToActiverecorddb < ActiveRecord::Migration
  def self.up
    #in theory, any errors will cause a roll back of the schema changes
    Training.transaction do 
      rename_table('training', 'trainings')
      
      change_table :trainings do |t|
        rename_column(:trainings, 'id_trn', 'id', :primary_key)
        t.integer 'employee_id'
        t.decimal('hours_trained', :precision=>5, :scale=>2, :default=>0)
        t.integer('position')
        t.string('type')
        t.text('description')      
        t.timestamps
      end
      
      add_index(:trainings, :employee_id)
      
      change_table :employees do |t|
        t.integer('manager_id')  
        t.boolean('active_bool', :default=>true)      
        t.remove(:email)    
        
      end
      rename_column(:employees, 'employee', 'name')
      rename_column(:employees, 'id_emp', 'id', :primary_key)    
      add_index(:employees, :manager_id)
      
      change_table :managers do |t|
        t.remove(:email)      
        t.boolean('active_bool', :default=>true)
      end
      rename_column :managers, 'manager', 'name'
      rename_column :managers, 'id_mgr', 'id', :primary_key
    end
  end

  def self.down
    raise IrreversibleMigrationError
  end
end
