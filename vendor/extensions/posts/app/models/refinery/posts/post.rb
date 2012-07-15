module Refinery
  module Posts
    class Post < Refinery::Core::BaseModel
      self.table_name = 'refinery_posts'

      attr_accessible :body, :topic_id, :position

      acts_as_indexed :fields => [:body]
      belongs_to :user, :class_name => "Refinery::User"      
      belongs_to :topic, :class_name => "Refinery::Topics::Topic"   

      validates :body, :presence => true
      validates :topic_id, :presence => true
    end
  end
end
