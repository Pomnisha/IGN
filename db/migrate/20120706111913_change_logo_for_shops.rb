class ChangeLogoForShops < ActiveRecord::Migration
  def up
    add_column :refinery_shops, :img_uid,  :string
  end

  def down
    remove_column :refinery_shops, :img_uid
  end
end
