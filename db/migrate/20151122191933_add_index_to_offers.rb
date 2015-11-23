class AddIndexToOffers < ActiveRecord::Migration
  def change
    add_index :offers, [:name], unique: true
  end
end
