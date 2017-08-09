require 'rails_helper'

RSpec.describe OrganizationSport do
  describe 'attributes'

  describe 'relationships' do
    it { is_expected.to belong_to :organization }
    it { is_expected.to belong_to :sport }
  end

  describe 'validations' do
    subject { build :organization_sport } # use factory,implicit subjct is empty

    it do
      is_expected.to have_db_index(%i[organization_id sport_id]).unique(true)
    end
  end

  it_behaves_like 'has_valid_factory'
end
