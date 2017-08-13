require 'rails_helper'

RSpec.describe Race do
  describe 'attributes' do
    %w[
      name
      category
      starts_at
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :discipline }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :discipline }
  end

  describe 'default_values_on_create' do
    it 'use discipline name' do
      name = 'My Discipline'
      discipline = build :discipline, name: name
      race = create :race, discipline: discipline

      expect(race.name).to eq name
    end

    it 'use final category' do
      race = create :race

      expect(race).to be_final
    end
  end

  it_behaves_like 'has_valid_factory'
end
