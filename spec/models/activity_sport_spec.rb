require 'rails_helper'

RSpec.describe ActivitySport do
  describe 'attributes'

  describe 'relationships' do
    it { is_expected.to belong_to :activity }
    it { is_expected.to belong_to :sport }
  end

  describe 'validations' do
    subject { build :activity_sport } # use factory,implicit subject is empty

    it { is_expected.to validate_presence_of :activity }
    it { is_expected.to validate_presence_of :sport }
    it { is_expected.to have_db_index(%i[activity_id sport_id]).unique(true) }
  end

  it_behaves_like 'has_valid_factory'
end
