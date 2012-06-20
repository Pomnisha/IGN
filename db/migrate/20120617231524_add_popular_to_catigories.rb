class AddPopularToCatigories < ActiveRecord::Migration
  def up
    add_column :refinery_categories, :popular, :boolean, :defaul => 0
  end
  
  def down
    remove_column :refinery_categories, :popular
  end
  
end
