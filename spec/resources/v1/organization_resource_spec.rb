require 'rails_helper'
module V1
  RSpec.describe OrganizationResource do
    subject(:organization_resource) { described_class.new Organization.new, {} }

    let(:creatable_fields) { %i[name status] }

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
      expect(organization_resource.fetchable_fields).to eq(
        %i[id] + creatable_fields + %i[created_at updated_at]
      )
    end
  end
end
