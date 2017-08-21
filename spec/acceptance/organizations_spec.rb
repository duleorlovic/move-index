require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Organizations' do
  header 'Content-Type', 'application/vnd.api+json'

  shared_context 'organization parameters' do
    parameter :type, 'Type of of resource, Must be organization', required: true
    let(:type) { 'organizations' }

    parameter :name, 'Name of the organization', scope: :attributes, required:
      true
    parameter :status, "Status of organization #{Organization.statuses}", scope:
      :attributes, required: true
  end

  post '/v1/organizations' do
    include_context 'organization parameters'
    let(:type) { 'organizations' }
    let(:name) { 'My Organization' }
    let(:status) { 0 }

    example_request 'Create organization' do
      expect(response_status).to be 201
      organization = JSON.parse(response_body)
      expect(organization['data']['attributes']['name']).to eq send(:name)
    end
  end

  get '/v1/organizations/:id' do
    let(:organization) { create :organization }
    let(:id) { organization.id }

    example_request 'Get organization' do
      expect(response_status).to be 200
      organization_json = JSON.parse(response_body)
      expect(organization_json['data']['attributes']['name']).to eq(
        organization.name
      )
    end
  end

  patch '/v1/organizations/:organization_id' do
    let(:organization) { create :organization, name: 'My Organization' }
    let(:organization_id) { organization.id }
    include_context 'organization parameters' do
      parameter :id, 'Id of the organization.', required: true
    end
    let(:id) { organization.id }
    let(:name) { 'Your Organization' }

    example_request 'Update organization' do
      expect(response_status).to be 200
      organization_json = JSON.parse(response_body)
      expect(organization_json['data']['attributes']['name']).to eq send(:name)
    end
  end

  get '/v1/organizations' do
    before { 2.times { create :organization } }
    example_request 'Index organizations' do
      expect(response_status).to be 200
      organizations_json = JSON.parse(response_body)
      expect(organizations_json['data'].size).to eq 2
    end
  end

  delete '/v1/organizations/:organization_id' do
    before { 2.times { create :organization } }
    let(:organization) { Organization.last }
    let(:organization_id) { organization.id }
    parameter :id, 'Id of the organization.', required: true
    let(:id) { organization.id }

    example 'Delete organization' do
      expect { do_request }.to(change { Organization.all.size })
    end
  end
end
