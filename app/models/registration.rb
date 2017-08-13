class Registration < ApplicationRecord
  belongs_to :discipline
  belongs_to :user

  validates :discipline, :user, presence: true
end
