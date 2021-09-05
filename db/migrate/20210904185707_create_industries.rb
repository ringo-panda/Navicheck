class CreateIndustries < ActiveRecord::Migration[6.1]
  def change
    create_table :industries do |t|
      t.string :industry_name
      t.integer :user_id

      t.timestamps
    end
  end
end
