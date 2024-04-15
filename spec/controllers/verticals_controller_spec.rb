require 'rails_helper'

RSpec.describe VerticalsController, type: :controller do
  let(:valid_attributes) {
    { name: 'New Vertical' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  let!(:vertical) { create(:vertical) }  # Using FactoryBot to create a vertical

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: vertical.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Vertical" do
        expect {
          post :create, params: { vertical: valid_attributes }
        }.to change(Vertical, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vertical" do
        expect {
          post :create, params: { vertical: invalid_attributes }
        }.to change(Vertical, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Updated Vertical' }
      }

      it "updates the requested vertical" do
        new_name = "Updated Vertical #{Vertical.count + 1}"
        put :update, params: { id: vertical.to_param, vertical: { name: new_name } }
        vertical.reload
        expect(vertical.name).to eq(new_name)
        expect(response).to have_http_status(:ok) # Ensure this is checking for the correct status
      end
    end

    context "with invalid parameters" do
      it "returns a failure response" do
        put :update, params: { id: vertical.to_param, vertical: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested vertical" do
      expect {
        delete :destroy, params: { id: vertical.to_param }
      }.to change(Vertical, :count).by(-1)
      expect(response).to be_successful
    end
  end
end
