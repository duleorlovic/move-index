require 'rails_helper'

RSpec.describe OrganizationUser do
  describe 'attributes' do
    it { is_expected.to have_attribute :role }
  end

  describe 'relationships' do
    it { is_expected.to belong_to :organization }
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    subject { build :organization_user } # use factory,implicit subject is empty

    it do
      is_expected.to have_db_index(%i[organization_id user_id]).unique(true)
    end
  end

  it_behaves_like 'has_valid_factory'
end
