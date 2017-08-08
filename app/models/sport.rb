class Sport < ApplicationRecord
  has_many :activity_sports
  has_many :activities, through: :activity_sports

  validates :name, uniqueness: true
end
