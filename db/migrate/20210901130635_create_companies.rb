class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.integer :industry_id
      t.integer :user_id
      t.string :company_name
      t.text :company_memo
      t.text :company_cite_url
      t.text :recruit_cite_url
      t.string :recruit_cite_username
      t.string :recruit_cite_password
      t.integer :selection_status_id
      t.integer :wish_degree_id
      t.string :location

      t.timestamps
    end
  end
end
