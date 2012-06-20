module Refinery
  module Banners
    module Admin
      class BannersController < ::Refinery::AdminController

        crudify :'refinery/banners/banner',
                :title_attribute => 'url', :xhr_paging => true

      end
    end
  end
end
