require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Organizations' do
  header 'Content-Type', 'application/vnd.api+json'
  post '/v1/organizations' do
    parameter :type, 'Type of of resource, Must be organization', required: true
    let(:type) { 'organizations' }

    parameter :name, 'Name of the organization', scope: :attributes, required:
      true
    let(:name) { 'My Organization' }

    parameter :status, "Status of organization #{Organization.statuses}", scope:
      :attributes, required: true
    let(:status) { 0 }

    example_request 'Create organization' do
      expect(response_status).to be 201
      organization = JSON.parse(response_body)
      expect(organization['data']['attributes']['name']).to eq send(:name)
    end
  end
end
