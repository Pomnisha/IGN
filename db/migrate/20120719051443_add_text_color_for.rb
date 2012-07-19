class AddTextColorFor < ActiveRecord::Migration
  def up
    add_column :refinery_categories, :text_color, :string
  end

  def down
    remove_column :refinery_categories, :text_color
  end
end
