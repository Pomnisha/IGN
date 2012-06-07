module Refinery
  module Companies
    module Admin
      class CompaniesController < ::Refinery::AdminController

        crudify :'refinery/companies/company',
                :title_attribute => 'url', :xhr_paging => true

      end
    end
  end
end
