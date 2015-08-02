class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :health_record
  has_many :health_status_updates
  has_and_belongs_to_many :doctors

  accepts_nested_attributes_for :health_record
  accepts_nested_attributes_for :health_status_updates
end
