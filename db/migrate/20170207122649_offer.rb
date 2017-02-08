class Offer < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.timestamps
    end
  end
end
