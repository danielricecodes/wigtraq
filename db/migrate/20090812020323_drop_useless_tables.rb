class DropUselessTables < ActiveRecord::Migration
  def self.up
    drop_table :angel_time_off
    drop_table :case_closure_ytd
    drop_table :case_review_rates
    drop_table :close_rates
    drop_table :close_variables
    drop_table :baselines
    drop_table :kudos
    drop_table :k_results
    drop_table :products
    drop_table :t_results
    drop_table :user_mapping
  end

  def self.down
    raise IrreversibleMigrationError
  end
end
