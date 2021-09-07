class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :company_id
      t.integer :user_id
      t.integer :event_category_id
      t.string :event_name
      t.date :start_date
      t.time :start_time
      t.date :finish_date
      t.time :finish_time
      t.date :limit_date
      t.time :limit_time
      t.text :location
      t.text :meeting_url
      t.string :meeting_id
      t.string :meeting_password
      t.text :belongings
      t.string :clothes
      t.text :event_memo

      t.timestamps
    end
  end
end
