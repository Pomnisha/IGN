module Refinery
  module Services
    class Service < Refinery::Core::BaseModel
      self.table_name = 'refinery_services'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
