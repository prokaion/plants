class AddUrlToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :url, :string, null: false
  end
end
