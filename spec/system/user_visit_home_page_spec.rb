require 'rails_helper'

RSpec.feature 'User visit home page' do
  scenario 'see main title' do
    visit '/'

    expect(page).to have_text 'What is your Move Index ?'
  end
  scenario 'see main title on local languare' do
    original_host = Capybara.app_host
    Capybara.app_host = 'http://sr.dev'
    visit '/'

    expect(page).to have_text 'Koliko si se danas pokrenuo ?'
    Capybara.app_host = original_host
  end
end
