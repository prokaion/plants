class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :price_cent
      t.text :desc

      t.timestamps null: false
    end
  end
end
