class AddCityToUser < ActiveRecord::Migration
  def change
    add_column :refinery_users, :city, :string
  end
end
