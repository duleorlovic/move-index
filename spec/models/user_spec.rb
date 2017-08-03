require 'rails_helper'

RSpec.describe User do
  describe 'attributes' do
    %w[
      email
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'relationships'

  describe 'validations' do
    describe 'uniqueness of email' do
      it 'prevent same email' do
        user = create :user
        user_copy = build :user, email: user.email

        user_copy.valid?

        expect(user_copy.errors[:email]).to include 'has already been taken'
      end

      it 'prevent padded email' do
        user = create :user
        user_copy = build :user, email: " #{user.email} "

        user_copy.valid?

        expect(user_copy.errors[:email]).to include 'has already been taken'
      end

      it 'prevent uppercased email' do
        user = create :user
        user_copy = build :user, email: user.email.upcase

        user_copy.valid?

        expect(user_copy.errors[:email]).to include 'has already been taken'
      end
    end
  end

  it 'has a valid factory' do
    expect(create(described_class.name.underscore)).to be_persisted
  end
end
