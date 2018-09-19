class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :profile_pic
      t.string :job_title
      t.string :expertise
      t.string :bio
      t.string :linkedin
      t.string :github
      t.string :personal_website
      t.boolean :will_buy_coffee
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
