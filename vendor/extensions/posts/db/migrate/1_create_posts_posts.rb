class CreatePostsPosts < ActiveRecord::Migration

  def up
    create_table :refinery_posts do |t|
      t.text :body
      t.integer :id
      t.integer :topic_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-posts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/posts/posts"})
    end

    drop_table :refinery_posts

  end

end
