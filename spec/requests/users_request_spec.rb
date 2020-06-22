# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :request do
  describe 'GET index' do
    let!(:user) { FactoryBot.create(:user) }
    it 'renders :index template' do
      get users_path
      expect(response).to be_successful
      expect(response.body).to include(user.username)
    end
  end

  describe 'GET show' do
    let!(:user) { FactoryBot.create(:user) }
    it 'renders :show template' do
      get user_path(user)
      expect(response).to be_successful
      expect(response.body).to include(user.username)
    end
  end
end
