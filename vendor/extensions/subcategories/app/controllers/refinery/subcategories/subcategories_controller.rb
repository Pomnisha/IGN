module Refinery
  module Subcategories
    class SubcategoriesController < ::ApplicationController

      before_filter :find_all_subcategories
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subcategory in the line below:
        present(@page)
      end

      def show
        @subcategory = Subcategory.find(params[:id])
        @shops = @subcategory.shops.page(params[:page]).per_page(5)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subcategory in the line below:
        #present(@page)
      end

    protected

      def find_all_subcategories
        @subcategories = Subcategory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/subcategories").first
      end

    end
  end
end
