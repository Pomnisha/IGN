module Refinery
  module Services
    class ServicesController < ::ApplicationController
      layout 'refinery/services'
#      before_filter :find_all_services
#      before_filter :find_page
      before_filter :allow_users_to_see_services

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @service in the line below:
#        present(@page)

      end

      def show
        @service = Service.find(params[:id])
        @companies = @service.companies.page(params[:page]).per_page(5)  
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @service in the line below:
 #       present(@page)
      end

    protected

      def find_all_services
        @services = Service.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/services").first
      end
      
      def allow_users_to_see_services
        redirect_to refinery.root_path unless current_refinery_user.shops.count > 0 
      end
    end
  end
end
