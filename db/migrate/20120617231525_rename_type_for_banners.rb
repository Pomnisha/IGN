class RenameTypeForBanners < ActiveRecord::Migration
  def up
    rename_column :refinery_banners, :type, :banner_type
    change_column :refinery_banners, :banner_type, :integer
  end

  def down
    rename_column :refinery_banners, :banner_type, :type 
    change_column :refinery_banners, :type, :string
  end
end
