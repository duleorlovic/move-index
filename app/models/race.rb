class Race < ApplicationRecord
  belongs_to :discipline

  enum category: %i[qualification final]

  validates :discipline, presence: true
  before_validation :default_values_on_create, on: :create

  def default_values_on_create
    self.name ||= discipline.name if discipline.present?
    self.category ||= :final
  end
end
