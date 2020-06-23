# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'UserCreatesEvents', type: :feature do
  let(:new_event_form) { NewEventForm.new }
  let(:login_form) { LoginForm.new }
  let(:user) { FactoryBot.create(:user) }

  background do
    login_form.visit_page.login_as(user)
  end
  scenario 'User creates a new event with valid data' do
    new_event_form.visit_page.fill_in_with(
      FactoryBot.attributes_for(:event, name: "John's birthday party!")
    ).submit
    expect(page).to have_content("Created event John's birthday party!")
  end

  scenario 'User cannot create achievement with invalid data' do
    pending 'not yet implemented'
  end
end
