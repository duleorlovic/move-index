require 'rails_helper'

RSpec.describe Result do
  describe 'attributes' do
    %w[
      time_in_s
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :participation }
    it { is_expected.to belong_to :check_point }
  end

  describe 'validations' do
    subject { build :result } # use factory since implicit subject is empty

    it { is_expected.to validate_presence_of :time_in_s }
    it { is_expected.to validate_presence_of :participation }
    it { is_expected.to validate_presence_of :check_point }
    it do
      is_expected.to have_db_index(%i[participation_id check_point_id])
        .unique(true)
    end
  end

  it_behaves_like 'has_valid_factory'
end
