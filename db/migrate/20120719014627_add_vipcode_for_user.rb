class AddVipcodeForUser < ActiveRecord::Migration
  def up
    add_column :refinery_users, :vip_code, :string
  end

  def down
    remove_column :refinery_users, :vip_code
  end
end
