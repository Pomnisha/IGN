module Refinery
  module Deliveries
    module Admin
      class DeliveriesController < ::Refinery::AdminController

        crudify :'refinery/deliveries/delivery',
                :title_attribute => 'entity', :xhr_paging => true

      end
    end
  end
end
