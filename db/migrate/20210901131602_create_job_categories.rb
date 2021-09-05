class CreateJobCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :job_categories do |t|
      t.integer :company_id
      t.integer :event_id
      t.integer :user_id
      t.string :job_name
      t.string :salary
      t.string :base_salary
      t.text :allowance
      t.string :annual_holiday
      t.string :bonus
      t.string :salary_increase
      t.text :overtime_hours
      t.text :paid_leave
      t.text :working_place
      t.text :jobcategories_memo

      t.timestamps
    end
  end
end
