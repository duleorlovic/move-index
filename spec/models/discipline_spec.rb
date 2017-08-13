require 'rails_helper'

RSpec.describe Discipline do
  describe 'attributes' do
    %w[
      name
      gender
      distance_m
      age_min
      age_max
      number_of_crew
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :sport }
    it { is_expected.to belong_to :event }
  end

  it 'define enum gender' do
    is_expected.to define_enum_for(:gender).with(%i[man women])
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :sport }
    it { is_expected.to validate_presence_of :event }
  end

  describe 'default_values_on_create' do
    let(:discipline) { create :discipline }

    it 'number_of_crew = 1' do
      expect(discipline.number_of_crew).to eq 1
    end
  end

  it_behaves_like 'has_valid_factory'
end
