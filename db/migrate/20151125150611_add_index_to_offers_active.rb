class AddIndexToOffersActive < ActiveRecord::Migration
  def change
    add_index :offers, [:active]
  end
end
