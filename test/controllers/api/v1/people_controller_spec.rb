require 'rails_helper'

RSpec.describe Api::V1::PeopleController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON with people data' do
      person = create(:person)
      get :index
      expect(JSON.parse(response.body)).to eq([JSON.parse(person.to_json)])
    end
  end

  describe 'POST create' do
    it 'creates a new person' do
      post :create, params: { person: { name: 'John Doe', email: 'john@example.com' } }
      expect(response).to have_http_status(:created)
    end

    it 'returns errors if name is blank' do
      post :create, params: { person: { name: '', email: 'john@example.com' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns errors if email is blank' do
      post :create, params: { person: { name: 'John Doe', email: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
