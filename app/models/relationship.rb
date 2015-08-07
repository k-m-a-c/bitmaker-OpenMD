class Relationship < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :status, presence: true
  validates :inviter, presence: true

  scope :accepted, -> { where(status: :accepted) }
  scope :pending, -> { where(status: :pending) }

  # Pending connection requests from Doctors to Patients
  scope :doctor_to_patient_requests, -> { where(status: :pending) && where(inviter: :doctor) }

  # Pending connection requests from Patients to Doctors
  scope :patient_to_doctor_requests, -> { where(status: :pending) && where(inviter: :patient) }

  scope :rejected, -> { where(status: :rejected) }

end
