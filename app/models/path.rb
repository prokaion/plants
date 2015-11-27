class Path < ActiveRecord::Base
  belongs_to :shop

  scope :shop, -> (shop) {where shop: shop}
  
  def sub_paths
    SubPath.where(path_id: self.id).order(id_ref: :asc)
  end
end
