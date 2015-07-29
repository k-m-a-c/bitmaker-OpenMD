class AddPatientIdToHealthRecord < ActiveRecord::Migration
  def change
    add_column :health_records, :patient_id, :integer
  end
end
