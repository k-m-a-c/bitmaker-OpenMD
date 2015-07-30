class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :health_record, through: :patient
  has_many :health_status_updates, through: :patients
  has_and_belongs_to_many :patients

end
