class Result < ApplicationRecord
  belongs_to :participation
  belongs_to :check_point

  validates :time_in_s, :participation, :check_point, presence: true
end
