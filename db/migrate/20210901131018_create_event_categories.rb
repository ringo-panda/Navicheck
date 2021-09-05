class CreateEventCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :event_categories do |t|
      t.string :event_category_name
      t.integer :user_id

      t.timestamps
    end
  end
end
