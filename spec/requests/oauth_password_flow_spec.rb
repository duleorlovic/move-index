require 'rails_helper'

# rubocop:disable RSpec/DescribeClass
RSpec.describe 'Oauth password flow' do
  let(:email) { 'my@email.com' }
  let(:password) { 'mypassword' }

  before { create :user, email: email, password: password }

  it 'creates a token when credentials are valid' do
    post '/oauth/token', params: {
      grant_type: 'password', username: email, password: password
    }

    expect(JSON.parse(response.body)['access_token']).not_to be_nil
  end

  it 'does not create a token when credentials are valid' do
    post '/oauth/token', params: {
      grant_type: 'password', username: email, password: 'wrong_password'
    }

    expect(JSON.parse(response.body)['access_token']).to be_nil
  end
end
