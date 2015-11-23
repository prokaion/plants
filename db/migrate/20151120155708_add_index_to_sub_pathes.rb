class AddIndexToSubPathes < ActiveRecord::Migration
  def change
    add_index :admin_sub_paths, [:path_id, :id_ref, :terminator]
  end
end
