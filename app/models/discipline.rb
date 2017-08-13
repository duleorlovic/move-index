class Discipline < ApplicationRecord
  belongs_to :sport
  belongs_to :event
  has_many :races

  enum gender: %i[man women]

  validates :sport, :event, presence: true
  before_validation :default_values_on_create, on: :create

  def default_values_on_create
    self.name ||= "#{gender} #{distance_m} #{age_min}-#{age_max}"
    self.number_of_crew ||= 1
  end
end
