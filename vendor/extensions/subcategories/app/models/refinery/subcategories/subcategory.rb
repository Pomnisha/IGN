module Refinery
  module Subcategories
    class Subcategory < Refinery::Core::BaseModel
      self.table_name = 'refinery_subcategories'

      attr_accessible :name, :category_id, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      validates :category_id, :presence => true
      belongs_to :category, :class_name => "Refinery::Categories::Category"
      has_many :shops, :class_name => "Refinery::Shops::Shop"
      
      
    end
  end
end
