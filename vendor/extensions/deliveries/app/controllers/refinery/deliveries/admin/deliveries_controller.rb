module Refinery
  module Deliveries
    module Admin
      class DeliveriesController < ::Refinery::AdminController

        crudify :'refinery/deliveries/delivery',
                :title_attribute => 'subject', :xhr_paging => true

        def index
          @deliveries = Delivery.all
        end
                
        def create 
          @delivery = Delivery.new(params[:delivery])
          if @delivery.save
            @delivery.delay.send_a_post
            render action: "index"
          else
            render action: "new"
          end
        end                
                
      end
    end
  end
end
