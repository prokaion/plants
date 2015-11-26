class AddPathToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :path, index: true, foreign_key: true
  end
end
