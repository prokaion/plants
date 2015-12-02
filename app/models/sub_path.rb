class SubPath < ActiveRecord::Base
  after_initialize :init 

  def init
    self.terminator ||= false if self.has_attribute? :terminator
  end
end
