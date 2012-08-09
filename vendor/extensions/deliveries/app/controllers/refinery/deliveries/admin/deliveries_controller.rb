module Refinery
  module Deliveries
    module Admin
      class DeliveriesController < ::Refinery::AdminController

        crudify :'refinery/deliveries/delivery',
                :title_attribute => 'subject', :xhr_paging => true

              
        def create 
          @delivery = Delivery.new(params[:delivery])
          if @delivery.save
            @delivery.delay.send_a_post
            redirect_to refinery.deliveries_admin_deliveries_url
          else
            render action: "new"
          end
        end                
                
      end
    end
  end
end
