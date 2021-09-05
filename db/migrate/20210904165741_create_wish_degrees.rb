class CreateWishDegrees < ActiveRecord::Migration[6.1]
  def change
    create_table :wish_degrees do |t|
      t.integer :user_id
      t.string :wish_degree_name

      t.timestamps
    end
  end
end
