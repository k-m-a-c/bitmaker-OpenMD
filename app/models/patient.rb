class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :confirmable,
    :rememberable,
    :trackable,
    :validatable

  has_one :health_record
  has_many :health_status_updates

  accepts_nested_attributes_for :health_record
  accepts_nested_attributes_for :health_status_updates

  has_many :relationships, dependent: :destroy
  has_many :doctors,
    -> { where(relationships: {status: 'accepted'})},
    :through => :relationships,
    dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :healthcard_number, presence: true
  validates :gender, presence: true
  validates :city, presence: true
  validates :country, presence: true

  validate :date_of_birth_is_in_the_past?

  def vitals
    data = [
      {
        name: "respiratory rate",
        data: {}
      },
      {
        name: "heart rate",
        data: {}
      },
      {
        name: "body temperature",
        data: {}
      },
      {
        name: "blood pressure",
        data: {}
      },
      {
        name: "physical health score",
        data: {}
      },
      {
        name: "mental health score",
        data: {}
      }
    ]

    self.health_status_updates.each do |u|
      data.at(0)[:data] = {
        u.created_at => u.respiratory_rate
      }
      data.at(1)[:data] = {
        u.created_at => u.heart_rate
      }
      data.at(2)[:data] = {
        u.created_at => u.body_temperature
      }
      data.at(3)[:data] = {
        u.created_at => u.physical_health_score
      }
      data.at(4)[:data] = {
        u.created_at => u.physical_health_score
      }
      data.at(5)[:data] = {
        u.created_at => u.mental_health_score
      }
    end

    return data
  end

  # custom validations
  def date_of_birth_is_in_the_past?
    if date_of_birth.present? && date_of_birth > Date.tomorrow
      errors.add(:date_of_birth, "your date of birth must be in the past")
    end
  end

end
