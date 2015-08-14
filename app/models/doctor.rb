class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :confirmable,
    :rememberable,
    :trackable,
    :validatable

  has_one :health_record, through: :patient
  has_many :health_status_updates, through: :patients

  has_many :relationships, dependent: :destroy
  has_many :patients,
    -> { where(relationships: {status: 'accepted'})},
    :through => :relationships,
    dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :doctor_uid, presence: true, numericality: true
  validates :gender, presence: true
  validates :specialization, presence: true
  validates :institution, presence: true
  validates :city, presence: true
  validates :country, presence: true

  validate :phone_number_is_nil_or_integer

private
  def phone_number_is_nil_or_integer
    n = phone_number
    unless n.is_a?(Integer) || n.is_a?(NilClass)
      errors.add(:phone_number, "Must be empty or a number")
    end
  end

end
