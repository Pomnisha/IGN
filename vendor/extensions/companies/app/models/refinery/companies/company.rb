module Refinery
  module Companies
    class Company < Refinery::Core::BaseModel
      self.table_name = 'refinery_companies'

      attr_accessible :url, :position

      acts_as_indexed :fields => [:url, :name, :short_description, :description, :city, :phone, :working_time, :e_mail, :address]

      validates :url, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
