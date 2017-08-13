require 'rails_helper'

RSpec.describe RegistrationParticipation do
  describe 'attributes'

  describe 'relationships' do
    it { is_expected.to belong_to :registration }
    it { is_expected.to belong_to :participation }
  end

  describe 'validations' do
    subject do
      # build since implicit subject is empty
      build :registration_participation
    end

    it { is_expected.to validate_presence_of :registration }
    it { is_expected.to validate_presence_of :participation }
    it do
      is_expected.to have_db_index(%i[registration_id participation_id])
        .unique(true)
    end
  end

  it_behaves_like 'has_valid_factory'
end
