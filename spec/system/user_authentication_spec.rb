require 'rails_helper'

RSpec.feature 'User Authentication' do
  let(:email) { 'my-user@asd.asd' }
  let(:password) { 'password' }

  scenario 'Register' do
    visit '/'
    click_link 'Register'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'

    expect(page).to have_content 'A message with a confirmation'
  end

  scenario 'log in' do
    user = create :user
    visit '/'
    click_link 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content user.email
  end

  scenario 'sign out' do
    user = create :user
    login_as user
    visit '/'

    click_link 'Log out'

    expect(page).to have_content 'Log in'
  end
end
