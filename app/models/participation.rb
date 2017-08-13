class Participation < ApplicationRecord
  belongs_to :race
  has_many :registration_participations
  has_many :registrations, through: :registration_participations

  validates :race, presence: true
  validate :_number_of_users_match_discipline

  def _number_of_users_match_discipline
    return unless race
    target_number = race.discipline.number_of_crew
    return if registration_participations.length == target_number
    errors.add(:base, "#{target_number} users is needed")
  end
end
