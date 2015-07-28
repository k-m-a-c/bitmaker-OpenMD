class Doctor < ActiveRecord::Base
  has_one :health_record, through: :patient
  has_many :health_status_updates, through: :patients
  has_and_belongs_to_many :patients

end
