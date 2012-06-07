module Refinery
  module Companies
    class CompaniesController < ::ApplicationController

      before_filter :find_all_companies
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @company in the line below:
        present(@page)
      end

      def show
        @company = Company.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @company in the line below:
        present(@page)
      end

    protected

      def find_all_companies
        @companies = Company.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/companies").first
      end

    end
  end
end
