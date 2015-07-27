class ChangeDoctorUidIntegerLimit < ActiveRecord::Migration
  def change
    change_column :doctors, :doctor_uid, :integer, limit: 5, null: false
  end
end
