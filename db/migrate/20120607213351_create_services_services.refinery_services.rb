# This migration comes from refinery_services (originally 1)
class CreateServicesServices < ActiveRecord::Migration

  def up
    create_table :refinery_services do |t|
      t.string :name
      t.integer :logo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-services"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/services/services"})
    end

    drop_table :refinery_services

  end

end
