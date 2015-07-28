class CreateHealthRecords < ActiveRecord::Migration
  def change
    create_table :health_records do |t|
      t.text :allergies, limit: 1000
      t.text :medications, limit: 1000
      t.text :surgeries, limit: 1000
      t.text :existing_conditions, limit: 1000

      t.timestamps null: false
    end
  end
end
