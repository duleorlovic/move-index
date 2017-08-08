require 'rails_helper'

RSpec.describe Sport do
  describe 'attributes' do
    %w[
      name
      description
      icon_url
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships' do
    it { is_expected.to have_many :activities }
  end

  describe 'validations' do
    subject { build :sport } # use factory since implicit subject is empty

    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to have_db_index(:name).unique(true) }
  end

  it_behaves_like 'has_valid_factory'
end
