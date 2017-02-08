class CreateMention < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :user_id, null: true
      t.integer :offer_id
      t.text :text
      t.timestamps
    end
  end
end
