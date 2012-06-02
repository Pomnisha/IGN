module Refinery
  module Shops
    class Shop < Refinery::Core::BaseModel
      self.table_name = 'refinery_shops'

      attr_accessible :url, :position, :name, :short_description, :description, :working_time, :map, 
                      :subcategory_id, :city, :phone, :e_mail, :logo_id, :vip_code
      acts_as_indexed :fields => [:url, :name, :short_description, :description, :city, :phone, :working_time]
      belongs_to :user, :class_name => "Refinery::User"
      belongs_to :subcategory, :class_name => "Refinery::Subcategories::Subcategory"
#      validates :url, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
