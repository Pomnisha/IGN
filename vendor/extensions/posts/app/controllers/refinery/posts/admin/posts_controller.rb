module Refinery
  module Posts
    module Admin
      class PostsController < ::Refinery::AdminController

        crudify :'refinery/posts/post', :xhr_paging => true

      end
    end
  end
end
