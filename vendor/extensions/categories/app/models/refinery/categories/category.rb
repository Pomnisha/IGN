module Refinery
  module Categories
    class Category < Refinery::Core::BaseModel
      self.table_name = 'refinery_categories'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:id]

      validates :name, :presence => true, :uniqueness => true
      has_many :subcategories
    end
  end
end
