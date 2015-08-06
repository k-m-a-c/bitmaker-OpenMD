class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :health_record, through: :patient
  has_many :health_status_updates, through: :patients

  has_many :relationships, dependent: :destroy
  has_many :patients,
    -> { where(relationships: {status: 'accepted'})},
    :through => :relationships,
    dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :doctor_uid, presence: true, numericality: true
  validates :gender, presence: true
  validates :specialization, presence: true
  validates :institution, presence: true
  validates :city, presence: true
  validates :country, presence: true

end
