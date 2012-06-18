class AddNameForBannersAndMenus < ActiveRecord::Migration
  def up
    add_column :refinery_banners, :name, :string
    add_column :refinery_menus, :name, :string
  end

  def down
    remove_column :refinery_banners, :name
    remove_column :refinery_menus, :name
  end
end
