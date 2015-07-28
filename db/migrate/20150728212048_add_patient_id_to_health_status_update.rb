class AddPatientIdToHealthStatusUpdate < ActiveRecord::Migration
  def change
    add_column :health_status_updates, :patient_id, :integer
  end
end
