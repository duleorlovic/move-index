class OrganizationSport < ApplicationRecord
  belongs_to :organization
  belongs_to :sport

  validates :organization, :sport, presence: true
end
