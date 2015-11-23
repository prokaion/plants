class CreateAdminSubPaths < ActiveRecord::Migration
  def change
    create_table :admin_sub_paths do |t|
      t.string :part
      t.integer :path_id
      t.boolean :terminator
      t.integer :id_ref

      t.timestamps null: false
    end
  end
end
