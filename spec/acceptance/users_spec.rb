require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Users' do
  header 'Content-Type', 'application/vnd.api+json'

  shared_context 'user parameters' do
    parameter :type, 'Type of of resource, Must be user', required: true
    let(:type) { 'users' }

    parameter :email, 'Email of the user', scope: :attributes, required: true
    parameter :password, 'Password of the user', scope: :attributes
  end
  post '/v1/users' do
    include_context 'user parameters'
    let(:email) { 'my@email.com' }
    let(:password) { 'mypassword' }

    example_request 'Create user' do
      expect(response_status).to be 201
      user = JSON.parse response_body
      expect(user['data']['attributes']['email']).to eq email
    end
  end
end
