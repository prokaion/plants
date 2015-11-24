class Path < ActiveRecord::Base
  belongs_to :shop

  def sub_paths
    SubPath.where(path_id: self.id)
  end
end
