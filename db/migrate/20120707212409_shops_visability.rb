class ShopsVisability < ActiveRecord::Migration
  def up
    add_column :refinery_shops, :visability, :boolean, :default => false
  end

  def down
    remove_column :refinery_shops, :visability    
  end
end
