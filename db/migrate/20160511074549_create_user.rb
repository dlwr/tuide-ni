class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :line_id, null: false
      t.string :display_name, null: true
      t.string :picture_url, null: true
      t.timestamps
    end
  end
end
