class AddSubjectToDelivery < ActiveRecord::Migration
  def change
    add_column :refinery_deliveries, :subject, :string
  end
end
