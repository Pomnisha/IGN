module Refinery
  module Topics
    module Admin
      class TopicsController < ::Refinery::AdminController

        crudify :'refinery/topics/topic',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
