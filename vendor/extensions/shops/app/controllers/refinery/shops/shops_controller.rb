module Refinery
  module Shops
    class ShopsController < ::ApplicationController

      before_filter :find_all_shops
#      before_filter :find_page
      before_filter :correct_user ,:only => [:edit, :update, :destroy]
      
      crudify :'refinery/shops/shop', :title_attribute => 'url', :xhr_paging => true
      
      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @shop in the line below:
 #       present(@page)
      end
      def new
        @shop = Shop.new
      end
      def show
        @shop = Shop.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @shop in the line below:
#        present(@page)
      end
      
      def edit
      # object gets found by find_#{singular_name} function
      @shop = Shop.find(params[:id])
      end
      
      def create
        @shop = Shop.new(params[:shop])
        @pic = Refinery::Image.new(params[:shop[logo_id]])
        @shop.logo_id = @pic.id
        @pic.save
        if @shop.save
          render action: "show", notice: 'Shop was successfully created.'
        else
          render action: "new"
        end
      end
  
      def update
        if @shop.update_attributes(params[:shop])
          redirect_to refinery.shops_shop_path(@shop), notice: 'Shop was successfully updated.'
        else
          render action: "edit"
        end
      end      
    
      def destroy
      # object gets found by find_#{singular_name} function
      if @shop.destroy
          redirect_to refinery.root_path, notice: 'Shop was successfully deleted.'
        else
          render action: "show"
        end
      end
    
      Rails
    protected

      def add_user_into
        @shop.user_id = current_refinery_user
      end
        
      def find_all_shops
        @shops = Shop.order('position ASC')
      end

#      def find_page
#        @page = ::Refinery::Page.where(:link_url => "/shops").first
#      end
      def correct_user
        @shop = Shop.find(params[:id])
        current_refinery_user == @shop.user_id
      end
    end
  end
end
