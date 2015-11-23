class Admin::Path < ActiveRecord::Base
  belongs_to :shop

  def sub_paths
    Admin::SubPath.where(path_id: self.id)
  end
end
