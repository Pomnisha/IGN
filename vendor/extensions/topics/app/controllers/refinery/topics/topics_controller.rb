module Refinery
  module Topics
    class TopicsController < ::ApplicationController
      before_filter :correct_user ,:only => [:edit, :update, :destroy]
      before_filter :find_all_topics
#      before_filter :find_page
      crudify :'refinery/topics/topic',
                :title_attribute => 'name', :xhr_paging => true
      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @topic in the line below:
        @topics = Topic.search(params[:search]).where(:visiable => true).page(params[:page]).per_page(5)        
#        present(@page)
      end
      
      def new 
        @topic = Topic.new
      end
      
      def show
        @topic = Topic.where(:visiable => true, :id => params[:id]).first
        
        redirect_to refinery.root_path if @topic.nil?
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @topic in the line below:
#        present(@page)
      end
      
      def edit
      # object gets found by find_#{singular_name} function
      @topic = Topic.find(params[:id])
      end      
      
      def create 
        @topic = Topic.new(params[:topic])
        @topic.user_id = current_refinery_user
        if @topic.save
          render action: "show", notice: 'Topic was successfully created.'
        else
          render action: "new"
        end
      end
      
      def update
        if @topic.update_attributes(params[:topic])
          redirect_to refinery.shops_shop_path(@topic), notice: 'Topic was successfully created.'
        else
          render action: "edit"
        end
      end      
    
      def destroy
      # object gets found by find_#{singular_name} function
      if @topic.destroy
          redirect_to refinery.root_path, notice: 'The topic was deleted.'
        else
          render action: "show"
        end
      end      
      
    protected

      def find_all_topics
        @topics = Topic.order('position ASC')
      end

      def correct_user
        @topic = Topic.find(params[:id])
        redirect_to refinery.root_path unless current_refinery_user.id == @topic.user_id
      end
    end
  end
end
