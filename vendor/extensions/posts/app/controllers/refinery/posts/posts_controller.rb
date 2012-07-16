module Refinery
  module Posts
    class PostsController < ::ApplicationController
      before_filter :correct_user ,:only => [:edit, :update, :destroy]
      before_filter :find_all_posts

      crudify :'refinery/posts/post', :xhr_paging => true

      def create 
        @post = Post.new(params[:post])
        @post.user_id = current_refinery_user
        if @post.save
          render action: "index", notice: 'Post was successfully created.'
        else
          render action: "new"
        end
      end
      
    protected

      def find_all_posts
        @posts = Post.order('position ASC')
      end

      def correct_user
        @topic = Topic.find(params[:id])
        redirect_to refinery.root_path unless current_refinery_user.id == @topic.user_id
      end

    end
  end
end
