# frozen_string_literal: true

require 'rails_helper'

describe 'Events', type: :request do
  shared_examples 'public access to events' do
    describe 'GET index' do
      let!(:user) { FactoryBot.create(:random_user) }
      let!(:event) { FactoryBot.create(:event, creator_id: user.id) }
      it 'renders :index template' do
        get events_path
        expect(response.body).to render_template(:index)
      end

      it 'displays public events to template' do
        get events_path
        expect(assigns(:events)).to include(event)
      end
    end
  end

  describe 'guest user' do
    it_behaves_like 'public access to events'

    describe 'GET new' do
      it 'redirects to login page' do
        get new_event_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST create' do
      it 'redirects to login page' do
        post events_path, params: { event: {} }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'authenticated user' do
    let(:user) { FactoryBot.create(:user) }

    setup { sign_in(user) }
    it_behaves_like 'public access to events'

    describe 'GET new' do
      it 'renders :new template' do
        get new_event_path
        expect(response).to render_template(:new)
      end

      it 'assigns new Event to @event' do
        get new_event_path
        expect(assigns(:event)).to be_a_new(Event)
      end
    end

    context 'valid data' do
      describe 'POST create' do
        let(:valid_data) { FactoryBot.attributes_for(:event, creator_id: user.id) }
        it 'redirect to events#show' do
          post events_path, params: { event: valid_data} 
          expect(response).to redirect_to(event_path(assigns[:event]))
        end
      end
    end
  end
end
