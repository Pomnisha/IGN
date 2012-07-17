class AddVipCodeForCompany < ActiveRecord::Migration
  def up
    add_column :refinery_companies, :vip_code, :string
  end

  def down
    remove_column :refinery_companies, :vip_code
  end
end
