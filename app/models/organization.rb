class Organization < ApplicationRecord
  has_many :organization_users
  has_many :users, through: :organization_users

  validates :name, presence: true

  enum status: %i[personal registered_club]
end
