module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners'

      attr_accessible :banner_type, :url, :image_id, :position
      belongs_to :image, :class_name => '::Refinery::Image'

    end
  end
end
