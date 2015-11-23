class CreateAdminPaths < ActiveRecord::Migration
  def change
    create_table :admin_paths do |t|
      t.string :name
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
