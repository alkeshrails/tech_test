require 'rails_helper'

RSpec.describe Api::V1::DetailsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    it 'creates a new detail' do
      person = create(:person)
      post :create, params: { detail: { description: 'Some detail', person_id: person.id } }
      expect(response).to have_http_status(:created)
    end

    it 'returns errors if description is blank' do
      post :create, params: { detail: { description: '', person_id: 1 } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns errors if person_id is blank' do
      post :create, params: { detail: { description: 'Some detail', person_id: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT update' do
    let(:detail) { create(:detail) }

    it 'updates an existing detail' do
      put :update, params: { id: detail.id, detail: { description: 'Updated detail' } }
      expect(response).to have_http_status(:success)
      expect(detail.reload.description).to eq('Updated detail')
    end
  end
end
