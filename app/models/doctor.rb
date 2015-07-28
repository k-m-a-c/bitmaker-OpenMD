class Doctor < ActiveRecord::Base
  has_one :health_record, through: :patient
  has_many :health_status_updates, through: :patients
  has_and_belongs_to_many :patients

  authenticates_with_sorcery!

  validates :password, length: { minimum: 7 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

end