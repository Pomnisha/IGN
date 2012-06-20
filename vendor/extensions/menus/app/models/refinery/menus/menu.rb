module Refinery
  module Menus
    class Menu < Refinery::Core::BaseModel
      self.table_name = 'refinery_menus'

      attr_accessible :type, :position

      acts_as_indexed :fields => [:type, :url]

      validates :type, :presence => true, :uniqueness => true
    end
  end
end
