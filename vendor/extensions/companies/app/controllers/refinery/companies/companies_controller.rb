module Refinery
  module Companies
    class CompaniesController < ::ApplicationController
      layout 'refinery/services'
      before_filter :allow_users_to_see_services
      before_filter :find_all_companies
#      before_filter :find_page
#      before_filter :correct_user ,:only => [:edit, :update, :destroy]
      
      crudify :'refinery/companies/company', :title_attribute => 'url', :xhr_paging => true
      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @company in the line below:
#        present(@page)

#        @companies = Company.search(params[:search])
        @companies = Company.search(params[:search]).where(:visability => true).page(params[:page]).per_page(5)    

      end
      def new
        @company = Company.new
      end
      def my
        @companies = current_refinery_user.companies.page(params[:page]).per_page(5)
        render action: "my"
      end
      def show
        @company = Company.where(:visability => true, :id => params[:id]).first
        
        redirect_to refinery.root_path unless !@company.nil?

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @company in the line below:
        #present(@page)
      end
      
      def create
        @company = Company.new(params[:company])
        @company.user_id = current_refinery_user.id
        if @company.save
          render action: "show", notice: 'Company was successfully created.'
        else
          render action: "new"
        end
      end
      
      def update
        if @company.update_attributes(params[:company])
          redirect_to refinery.companies_company_path(@company), notice: 'Company was successfully updated.'
        else
          render action: "edit"
        end
      end   
      
    protected

      def find_all_companies
        @companies = Company.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/companies").first
      end
      
      def correct_user
        @company = Company.find(params[:id])
        redirect_to refinery.root_path unless current_refinery_user.id == @company.user_id
      end
      
      def allow_users_to_see_services
        redirect_to refinery.root_path unless (current_refinery_user.shops.count > 0 or current_refinery_user.has_role?(:superuser))
      end
    end
  end
end
