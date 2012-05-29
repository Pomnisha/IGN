class CreateSubcategoriesSubcategories < ActiveRecord::Migration

  def up
    create_table :refinery_subcategories do |t|
      t.integer :id
      t.string :name
      t.integer :category_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-subcategories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/subcategories/subcategories"})
    end

    drop_table :refinery_subcategories

  end

end
