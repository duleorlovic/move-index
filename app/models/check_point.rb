class CheckPoint < ApplicationRecord
  belongs_to :discipline

  validates :discipline, presence: true
  before_validation :default_values_on_create, on: :create

  def default_values_on_create
  end
end
