class MapChangesForShops < ActiveRecord::Migration
  def up
    remove_column :refinery_shops, :map
    add_column :refinery_shops, :map_latitude, :float
    add_column :refinery_shops, :map_longtitude, :float
    add_column :refinery_shops, :address, :string
  end

  def down
    add_column :refinery_shops, :map, :text
    remove_column :refinery_shops, :map_latitude
    remove_column :refinery_shops, :map_longtitude
    remove_column :refinery_shops, :address
  end
end
