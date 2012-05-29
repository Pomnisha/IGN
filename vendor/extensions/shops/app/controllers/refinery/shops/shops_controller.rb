module Refinery
  module Shops
    class ShopsController < ::ApplicationController

      before_filter :find_all_shops
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @shop in the line below:
        present(@page)
      end

      def show
        @shop = Shop.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @shop in the line below:
        present(@page)
      end

    protected

      def find_all_shops
        @shops = Shop.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/shops").first
      end

    end
  end
end
