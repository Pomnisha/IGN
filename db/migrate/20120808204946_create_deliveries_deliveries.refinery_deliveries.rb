# This migration comes from refinery_deliveries (originally 1)
class CreateDeliveriesDeliveries < ActiveRecord::Migration

  def up
    create_table :refinery_deliveries do |t|
      t.string :entity
      t.integer :category_id
      t.integer :subcategory_id
      t.integer :service_id
      t.string :city
      t.string :status
      t.text :ids
      t.integer :position
      t.text :body
      
      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-deliveries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/deliveries/deliveries"})
    end

    drop_table :refinery_deliveries

  end

end
