module Refinery
  module Categories
    class Category < Refinery::Core::BaseModel

      self.table_name = 'refinery_categories'

      attr_accessible :name, :logo_id, :popular, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      belongs_to :logo, :class_name => '::Refinery::Image'
      has_many :subcategories, :class_name => "Refinery::Subcategories::Subcategory"
      has_many :shops, :through => :subcategories
    end
  end
end
