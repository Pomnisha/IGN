class CreateCompaniesCompanies < ActiveRecord::Migration

  def up
    create_table :refinery_companies do |t|
      t.string :url
      t.string :name
      t.text :short_description
      t.text :description
      t.integer :service_id
      t.string :city
      t.string :phone
      t.text :working_time
      t.string :e_mail
      t.integer :logo_id
      t.float :map_latitude
      t.float :map_longtitude
      t.string :address
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-companies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/companies/companies"})
    end

    drop_table :refinery_companies

  end

end
