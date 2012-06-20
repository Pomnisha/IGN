module Refinery
  module Menus
    class MenusController < ::ApplicationController

      before_filter :find_all_menus
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @menu in the line below:
        present(@page)
      end

      def show
        @menu = Menu.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @menu in the line below:
        present(@page)
      end

    protected

      def find_all_menus
        @menus = Menu.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/menus").first
      end

    end
  end
end
