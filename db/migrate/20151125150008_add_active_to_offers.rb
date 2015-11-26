class AddActiveToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :active, :boolean, default: false
  end
  #add_index :offers, [:active]

end
