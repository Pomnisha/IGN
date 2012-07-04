module Refinery
  module Companies
    class Company < Refinery::Core::BaseModel
      self.table_name = 'refinery_companies'

      attr_accessible :url, :name, :short_description, :description, :city, :phone, :working_time, :e_mail, :address, :position,
                      :map_latitude, :map_longtitude, :logo_id, :service_id
      acts_as_indexed :fields => [:url, :name, :short_description, :description, :city, :phone, :working_time, :address]

#      validates :url, :presence => true, :uniqueness => true
      belongs_to :user, :class_name => "Refinery::User"
      belongs_to :service, :class_name => "Refinery::Services::Service"
      belongs_to :logo, :class_name => '::Refinery::Image'
      
      def self.search(search)
        if search
          find(:all, :conditions => ['name LIKE ? OR short_description LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
#          find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
        else
          find(:all)
        end
      end      
      
    end
  end
end
