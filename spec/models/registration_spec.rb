require 'rails_helper'

RSpec.describe Registration do
  describe 'attributes' do
    %w[
      status
      tshirt_size
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :discipline }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :discipline }
  end

  it_behaves_like 'has_valid_factory'
end
