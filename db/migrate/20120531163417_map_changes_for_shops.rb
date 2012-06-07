class MapChangesForShops < ActiveRecord::Migration
  def up
    change_column :refinery_shops, :map, :float
    rename_column :refinery_shops, :map, :map_lattitude
    add_column :refinery_shops, :map_longtitude, :float
    add_column :refinery_shops, :address, :string
  end

  def down
    change_column :refinery_shops, :map_latitude, :text
    rename_column :refinery_shops, :map_lattitude, :map
    remove_column :refinery_shops, :map_longtitude
    remove_column :refinery_shops, :address
  end
end
