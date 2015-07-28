class AddHealthStatusUpdateIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :health_status_update_id, :integer
  end
end
