require 'rails_helper'

RSpec.feature 'User forgot password' do
  let(:email) { 'my@email.com' }
  let(:new_password) { 'new_password' }

  before do
    create :user, email: email
    visit '/'
    click_link 'Log in'
    click_link 'Forgot your password?'
    fill_in 'Email', with: email

    click_button 'Send'
    open_email email
  end
  scenario 'receives email' do
    expect(current_email).to have_content 'Change my password'
  end
  feature 'click on link' do
    before do
      current_email.click_link 'Change my password'
    end
    scenario 'shows change password form' do
      expect(page).to have_content 'New password'
    end
    feature 'able to change password' do
      before do
        fill_in 'New password', with: new_password
        fill_in 'Confirm new password', with: new_password
        click_button 'Change my password'
      end
      scenario 'show success message' do
        expect(page).to have_content 'Your password has been changed '\
        'successfully.'
      end
      scenario 'user can login with new password' do
        visit '/'
        click_link 'Log in'
        fill_in 'Email', with: email
        fill_in 'Password', with: new_password
        click_button 'Log in'

        expect(page).to have_content email
      end
    end
  end
end
