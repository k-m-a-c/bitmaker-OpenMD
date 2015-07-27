class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, index: true, null: false
      t.string :last_name, index: true, null: false
      t.string :email, index: true, null: false
      t.integer :phone_number, limit: 5, null: false
      t.text :healthcard_number, index: true, null: false
      t.string :gender
      t.date :date_of_birth
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
