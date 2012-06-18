module Refinery
  module Menus
    class Menu < Refinery::Core::BaseModel
      self.table_name = 'refinery_menus'

      attr_accessible :menu_type, :url, :name, :position

      acts_as_indexed :fields => [:menu_type, :url]

      validates :menu_type, :presence => true, :uniqueness => true
    end
  end
end
