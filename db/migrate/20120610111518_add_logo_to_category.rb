class AddLogoToCategory < ActiveRecord::Migration
  def up
    add_column :refinery_categories, :logo_id, :integer
  end
  def down
    remove_column :refinery_categories, :logo_id
  end
end
