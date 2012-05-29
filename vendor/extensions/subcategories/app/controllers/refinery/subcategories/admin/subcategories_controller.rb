module Refinery
  module Subcategories
    module Admin
      class SubcategoriesController < ::Refinery::AdminController

        crudify :'refinery/subcategories/subcategory',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
