# frozen_string_literal: true

class NewEventForm
  include Capybara::DSL

  def visit_page
    visit('/')
    click_on 'navbarDropdown'
    click_on 'Create Event'
    self
  end

  def fill_in_with(params = {})
    fill_in('event_name', with: params.fetch(:name))
    fill_in('event_description', with: params.fetch(:description))
    fill_in('event_location', with: params.fetch(:location))
    attach_file('event_cover_image', "#{Rails.root}/spec/fixtures/#{params.fetch(:cover_image, 'placeholder.jpg')}")
    self
  end

  def submit
    click_on('create_event_btn')
    self
  end
end
