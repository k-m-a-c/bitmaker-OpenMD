class RemoveNotNullFromDoctorsPhoneNumber < ActiveRecord::Migration
  def change
    remove_column :doctors, :phone_number, :integer
    add_column :doctors, :phone_number, :integer, limit: 5
  end
end
