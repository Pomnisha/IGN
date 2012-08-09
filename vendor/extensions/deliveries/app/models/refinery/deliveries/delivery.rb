#encode: utf-8
module Refinery
  module Deliveries
    class Delivery < Refinery::Core::BaseModel
      self.table_name = 'refinery_deliveries'
      ENTITIES = %w(users companies shops)
      
      attr_accessible :entity, :category_id, :subcategory_id, :service_id, :city, :ids, :body, :subject, :status, :position

      validates :entity, :presence => true
      validates_inclusion_of :entity, :in => Delivery::ENTITIES
      
      
      protected
      
      def send_a_post

        if self.entity == "users" then
          @entities = Refinery::User.where('city LIKE ?', "%#{self.city}%")
        elsif self.entity == "companies" then
          if !self.service_id.nil? then 
            @entities = Refinery::Services::Service.find(self.service_id).companies.where('city LIKE ?', "%#{self.city}%")
          elsif !self.category_id.nil? then
            @entities = Refinery::Companies::Company.where('city LIKE ?', "%#{self.city}%")
          end
        elsif self.entity == "shops" then
          if !self.subcategory_id.nil? then 
            @entities = Refinery::Subcategories::Subcategory.find(self.subcategory_id).shops.where('city LIKE ?', "%#{self.city}%")
          elsif !self.category_id.nil? then
            @entities = Refinery::Categories::Category.find(self.category_id).shops.where('city LIKE ?', "%#{self.city}%")
          else
            @entities = Refinery::Shops.where('city LIKE ?', "%#{self.city}%")
          end
        end
        

        @entities.each do |en|        
          DeliveryMailer.package_to_send(self, en)
        end
        
        self.status = 'done'
      end
      
    end
  end
end
