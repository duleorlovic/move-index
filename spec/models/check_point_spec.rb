require 'rails_helper'

RSpec.describe CheckPoint do
  describe 'attributes' do
    %w[
      distance
      order
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :discipline }
  end

  describe 'validations' do
    subject { build :check_point } # use factory since implicit subject is empty

    it { is_expected.to validate_presence_of :discipline }
  end

  describe 'default_values_on_create'

  it_behaves_like 'has_valid_factory'
end
