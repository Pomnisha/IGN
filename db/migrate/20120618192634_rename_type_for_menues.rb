class RenameTypeForMenues < ActiveRecord::Migration
  def up
    remove_column :refinery_menus, :type
    add_column :refinery_menus, :menu_type, :integer
  end

  def down
    remove_column :refinery_menus, :menu_type
    add_column :refinery_menus, :type, :string
  end
end
