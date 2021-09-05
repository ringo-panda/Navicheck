class CreateSelectionStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :selection_statuses do |t|
      t.string :status_name
      t.integer :user_id
      t.timestamps
    end
  end
end
