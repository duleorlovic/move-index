class OrganizationUser < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  enum role: %i[member admin no_longer]
end
