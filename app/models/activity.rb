class Activity < ApplicationRecord
  has_many :activity_sports
  has_many :sports, through: :activity_sports

  validates :name, uniqueness: true
end
