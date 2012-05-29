# This migration comes from refinery_shops (originally 1)
class CreateShopsShops < ActiveRecord::Migration

  def up
    create_table :refinery_shops do |t|
      t.string :url
      t.string :name
      t.text :short_description
      t.text :description
      t.integer :subcategory_id
      t.string :city
      t.string :phone
      t.text :working_time
      t.string :e_mail
      t.integer :logo_id
      t.text :map
      t.string :vip_code
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-shops"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/shops/shops"})
    end

    drop_table :refinery_shops

  end

end
