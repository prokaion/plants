class Shop < ActiveRecord::Base
  has_many :paths, dependent: :destroy
end
