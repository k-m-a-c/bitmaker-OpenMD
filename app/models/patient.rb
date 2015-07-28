class Patient < ActiveRecord::Base
  has_one :health_record
  has_many :health_status_updates
  has_and_belongs_to_many :doctors

  authenticates_with_sorcery!

end
