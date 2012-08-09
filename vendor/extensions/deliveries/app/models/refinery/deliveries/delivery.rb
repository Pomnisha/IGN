#encode: utf-8
module Refinery
  module Deliveries
    class Delivery < Refinery::Core::BaseModel
      self.table_name = 'refinery_deliveries'
      ENTITIES = %w(users companies shops)
      
      attr_accessible :entity, :category_id, :subcategory_id, :service_id, :city, :ids, :body, :subject, :status, :position

      validates :entity, :presence => true
      validates_inclusion_of :entity, :in => Delivery::ENTITIES
      
    end
  end
end
