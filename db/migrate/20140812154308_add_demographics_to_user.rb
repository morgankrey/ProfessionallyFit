class AddDemographicsToUser < ActiveRecord::Migration
   def change
      add_column :users, :age, :integer
      add_column :users, :sex, :string
      add_column :users, :height, :integer #inches
      add_column :users, :goal, :string
      add_column :users, :job_type, :string
      add_column :users, :work_schedule, :string
      add_column :users, :current_weight, :integer #pounds
      add_column :users, :desired_weight, :integer #pounds
      add_column :users, :meals_per_day, :integer
      add_column :users, :snacks_per_day, :integer
      add_column :users, :body_fat_pct, :integer
      add_column :users, :plan_type, :string
   end
end
