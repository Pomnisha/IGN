class AddColorForCategory < ActiveRecord::Migration
  def up
    add_column :refinery_categories, :color, :string
    add_column :refinery_categories, :color_active, :string, :default => "#B82B2B"
  end

  def down
    remove_column :refinery_categories, :color
    remove_column :refinery_categories, :color_active
  end
end
