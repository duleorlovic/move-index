class Event < ApplicationRecord
  belongs_to :organization

  validates :name, :organization, presence: true
  validate :_ends_at_greated_than_starts_at

  def _ends_at_greated_than_starts_at
    return if ends_at.blank? || starts_at.blank?
    return if ends_at > starts_at
    errors.add(:ends_at, "can't be greater than starts_at")
  end
end
