require 'rails_helper'

RSpec.describe Organization do
  describe 'attributes' do
    %w[
      name
      category
      username
      birth_date
      address
      city
      state
      country
      zip
      website
      email
      phone_number
      mobile_phone_number
      national_registration_id
      status
      latitude
      longitude
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to have_many :organization_users }
    it { is_expected.to have_many(:users).through(:organization_users) }
  end

  describe 'validations' do
    subject { build :organization } # use factory since subject is empty

    it { is_expected.to validate_presence_of :name }
  end

  it 'define gender' do
    is_expected.to define_enum_for(:status).with(%i[personal registered_club])
  end

  it_behaves_like 'has_valid_factory'
end
