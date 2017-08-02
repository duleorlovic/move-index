require 'rails_helper'

RSpec.feature 'User visit home page' do
  scenario 'see main title' do
    visit '/'

    expect(page).to have_text 'What is your Move Index ?'
  end
end
