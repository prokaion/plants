class AddNameToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :name, :string
  end
end
