require 'rails_helper'
module V1
  RSpec.describe UserResource do
    subject(:user_resource) { described_class.new User.new, {} }

    let(:creatable_fields) { %i[email password] }

    it 'has creatable_fields' do
      expect(described_class.creatable_fields({})).to eq(
        creatable_fields
      )
    end

    it 'has updatable_fields' do
      expect(described_class.updatable_fields({})).to eq(
        creatable_fields
      )
    end

    it 'has fetchable_fields' do
      expect(user_resource.fetchable_fields).to eq(
        %i[id email created_at updated_at]
      )
    end
  end
end
