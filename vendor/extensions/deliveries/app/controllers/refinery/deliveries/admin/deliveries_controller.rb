module Refinery
  module Deliveries
    module Admin
      class DeliveriesController < ::Refinery::AdminController

        crudify :'refinery/deliveries/delivery',
                :title_attribute => 'subject', :xhr_paging => true

              
        def create 
          @delivery = Delivery.new(params[:delivery])
          if @delivery.save
            send_a_post(@delivery)
            redirect_to refinery.deliveries_admin_deliveries_url
          else
            render action: "new"
          end
        end                
           
        
        
        
        def send_a_post(delivery)
        if delivery.entity == "users" then
          @entities = Refinery::User.where('city LIKE ?', "%#{delivery.city}%")
          
          @entities.each do |en|        
            DeliveryMailer.package_to_send_user(delivery, en)
          end
          
          
        elsif delivery.entity == "companies" then
          if !delivery.service_id.nil? then 
            @entities = Refinery::Services::Service.find(delivery.service_id).companies.where('city LIKE ?', "%#{delivery.city}%")
          elsif !delivery.category_id.nil? then
            @entities = Refinery::Companies::Company.where('city LIKE ?', "%#{delivery.city}%")
          end
          
          @entities.each do |en|        
            DeliveryMailer.package_to_send(delivery, en)
          end
          
          
        elsif delivery.entity == "shops" then
          if !delivery.subcategory_id.nil? then 
            @entities = Refinery::Subcategories::Subcategory.find(delivery.subcategory_id).shops.where('city LIKE ?', "%#{delivery.city}%")
          elsif !self.category_id.nil? then
            @entities = Refinery::Categories::Category.find(delivery.category_id).shops.where('city LIKE ?', "%#{delivery.city}%")
          else
            @entities = Refinery::Shops.where('city LIKE ?', "%#{delivery.city}%")
          end
          
          
          @entities.each do |en|        
            DeliveryMailer.package_to_send(delivery, en)
          end
          
          
        end
        
        delivery.status = 'done'
        delivery.save!
        
      end
        
        
        
      end
    end
  end
end
