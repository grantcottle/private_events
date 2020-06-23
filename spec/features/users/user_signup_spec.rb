require 'rails_helper'

RSpec.feature "User signup", type: :feature do
  let(:user) { build(:user) }

  scenario 'user can sign up with valid data' do
    visit new_user_registration_path

    fill_in 'user_username', with: user.username
    attach_file("user_avatar", "#{Rails.root}/spec/fixtures/avatar.png") 
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation

    expect do
      click_button 'Sign up'
    end.to change(User, :count).by(1)
  end
end
