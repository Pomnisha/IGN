class CompaniesVisability < ActiveRecord::Migration
  def up
    add_column :refinery_companies, :visability, :boolean, :default => false
  end

  def down
    remove_column :refinery_companies, :visability    
  end
end
