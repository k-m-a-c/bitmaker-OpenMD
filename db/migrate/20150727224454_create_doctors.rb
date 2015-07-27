class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name, index: true, null: false
      t.string :last_name, index: true, null: false
      t.string :email, index: true, null: false
      t.integer :phone_number, limit: 5, null: false
      t.integer :doctor_uid, index: true, null: false
      t.string :gender
      t.string :specialization, index: true
      t.string :institution, index: true
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
