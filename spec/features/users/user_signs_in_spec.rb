# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'UserSignsIns', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'user signs in' do
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully')
  end
end
