module Refinery
  module Topics
    class Topic < Refinery::Core::BaseModel
      self.table_name = 'refinery_topics'

      attr_accessible :name, :category_id, :user_id, :visiable, :position

      acts_as_indexed :fields => [:name]
      belongs_to :user, :class_name => "Refinery::User"
      belongs_to :category, :class_name => "Refinery::Categories::Category"      
      has_many :posts, :class_name => "Refinery::Posts::Post"      
      validates :name, :presence => true
      
      
      def self.search(search)
        if search
          where('name LIKE ?', "%#{search}%")

        else
          scoped
        end
      end      
    end
  end
end
