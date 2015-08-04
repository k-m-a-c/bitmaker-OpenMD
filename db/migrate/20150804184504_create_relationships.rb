class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :doctor_id, null: false
      t.integer :patient_id, null: false
      t.text :inviter, null: false
      t.text :invitee, null: false
      t.text :status, null: false

      t.timestamps null: false
    end
    add_index :relationships, :doctor_id
    add_index :relationships, :patient_id
    add_index :relationships, [:doctor_id, :patient_id], unique: true
  end
end
