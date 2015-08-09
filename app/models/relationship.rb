class Relationship < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :status, presence: true
  validates :inviter, presence: true

  def self.requests(status, inviter)
    Relationship.where(
      "status = ? AND inviter = ?",
      status, inviter
    )
  end

end
