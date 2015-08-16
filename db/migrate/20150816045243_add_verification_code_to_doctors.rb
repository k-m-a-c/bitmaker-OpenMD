class AddVerificationCodeToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :verfication_code, :string
    add_column :doctors, :phone_is_verified, :boolean
  end
end
