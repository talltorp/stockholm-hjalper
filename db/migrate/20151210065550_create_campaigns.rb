class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :funding_goal
      t.boolean :fully_funded
      t.string :title
      t.string :drop_off_address
      t.string :contact_person
      t.string :contact_phone
      t.string :contact_email
      t.text :body_text
      t.text :preamble

      t.timestamps null: false
    end
  end
end
