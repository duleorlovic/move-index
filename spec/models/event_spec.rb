require 'rails_helper'

RSpec.describe Event do
  describe 'attributes' do
    %w[
      name
      description
      starts_at
      ends_at
      registration_opens_at
      registration_ends_at
      email
      website
      status
      latitude
      longitude
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :organization }
  end

  describe 'validations' do
    subject(:event) { build :event } # use factory, implicit subject is empty

    it { is_expected.to validate_presence_of :name }

    it 'ends at if exists is later than starts_at' do
      event.starts_at = Time.current
      event.ends_at = event.starts_at - 1.day
      event.valid?

      expect(event.errors[:ends_at]).to include "can't be greater than "\
        'starts_at'
    end
  end

  it_behaves_like 'has_valid_factory'
end
