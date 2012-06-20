class ChangeImageTypeForBanners < ActiveRecord::Migration
  def up
    remove_column :refinery_banners, :image
    add_column :refinery_banners, :image_id, :integer
  end

  def down
    remove_column :refinery_banners, :image_id
    add_column :refinery_banners, :image, :string
  end
end
