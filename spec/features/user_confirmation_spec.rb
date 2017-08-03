require 'rails_helper'

RSpec.feature 'User confirmation email' do
  let(:email) { 'my-user@asd.asd' }
  let(:password) { 'password' }

  before do
    visit '/'
    click_link 'Sign up'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password

    click_button 'Sign up'
  end

  scenario 'shows message about confirmation email' do
    expect(page).to have_content 'A message with a confirmation link has been '\
    'sent to your email address.'
  end

  scenario 'user is not confirmed' do
    user = User.find_by email: email
    expect(user).not_to be_confirmed
  end

  feature 'confirmation email' do
    subject { open_email(email).body }

    scenario { is_expected.to have_text(/You can confirm/) }
    scenario { is_expected.to have_text email }
  end

  feature 'when clicking confirmation link in email' do
    before do
      open_email email
      current_email.click_link 'Confirm my account'
    end

    scenario 'shows confirmation message' do
      expect(page).to have_content 'Your email address has been successfully '\
      'confirmed.'
    end

    scenario 'confirms user' do
      user = User.find_by email: email
      expect(user).to be_confirmed
    end
  end
end
