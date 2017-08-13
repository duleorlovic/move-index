require 'rails_helper'

RSpec.describe Participation do
  describe 'attributes' do
    %w[
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :race }
    it { is_expected.to have_many :registrations }
  end

  describe 'validations' do
    subject { build :participation } # use factory, implicit subject is empty

    it { is_expected.to validate_presence_of :race }
  end

  describe 'check number of registrations = number_of_crew' do
    let(:discipline_for_2) { create :discipline, number_of_crew: 2 }
    let(:race) { create :race, discipline: discipline_for_2 }
    let(:participation) { build :participation, race: race }

    it 'does not allow less than number_of_crew' do
      participation.registration_participations.destroy(participation
        .registration_participations.last)
      participation.valid?

      expect(participation.errors[:base]).to include '2 users is needed'
    end
    it 'does not allow greater than number_of_crew' do
      new_registration = create :registration, discipline: discipline_for_2
      participation.registrations << new_registration
      participation.valid?

      expect(participation.errors[:base]).to include '2 users is needed'
    end
    it 'allow factory valid' do
      expect(participation.errors).to be_empty
    end
  end

  it_behaves_like 'has_valid_factory'
end
