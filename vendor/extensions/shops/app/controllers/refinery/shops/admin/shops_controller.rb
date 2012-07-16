module Refinery
  module Shops
    module Admin
      class ShopsController < ::Refinery::AdminController

        crudify :'refinery/shops/shop',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
