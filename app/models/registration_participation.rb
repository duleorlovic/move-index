class RegistrationParticipation < ApplicationRecord
  belongs_to :registration
  belongs_to :participation

  validates :registration, :participation, presence: true
end
