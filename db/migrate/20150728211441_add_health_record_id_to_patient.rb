class AddHealthRecordIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :health_record_id, :integer
  end
end
