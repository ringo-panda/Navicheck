class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :company_id
      t.integer :user_id
      t.integer :event_category_id
      t.string :event_name
      t.datetime :start_datetime
      t.datetime :finish_datetime
      t.datetime :limit_datetime
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
