class ActivitySport < ApplicationRecord
  belongs_to :activity
  belongs_to :sport

  validates :activity, :sport, presence: true
end
