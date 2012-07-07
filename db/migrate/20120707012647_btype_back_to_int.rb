class BtypeBackToInt < ActiveRecord::Migration
  def up
    remove_column :refinery_banners, :banner_type
    add_column :refinery_banners, :banner_type, :integer
  end
  def down
    remove_column :refinery_banners, :banner_type
    add_column :refinery_banners, :banner_type, :string
  end
end
