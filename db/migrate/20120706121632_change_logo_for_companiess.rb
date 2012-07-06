class ChangeLogoForCompaniess < ActiveRecord::Migration
  def up
    add_column :refinery_companies, :img_uid,  :string
  end

  def down
    remove_column :refinery_companies, :img_uid
  end
end
