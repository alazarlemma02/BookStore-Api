require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET /index" do
    subject {get :index}

    it "should route to categories" do
      subject
      expect(get: '/categories').to route_to("categories#index")
    end

    it "should return a status code of 200" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "should return proper json" do
      create_list :category, 3
      subject
      expect(json.class).to eq(Hash)
      expect(json).not_to be_empty
      expect(json_data.length).to eq(3)
    end

  end
  describe 'POST /create' do
    context "when the request is valid" do
      let(:valid_name){{name:"Horror"}}
      before{post :create, params: valid_name}
      it "should return a status code of 201" do #becuase 201 is for creation success
        expect(response).to have_http_status(201)
      end

      it "should send the correct name " do
        expect(json_data['name']).to eq('Horror')
      end
    end
    context "when the request is invalid" do

      describe "passing empty name" do
        let(:invalid_name1) { {name:""} }
        before{post :create, params: invalid_name1}
        it "should not accept the given name" do
          expect(response).not_to have_http_status(:ok)
        end
      end

      describe "passing invalid length for the name" do
        let(:invalid_name2) { {name:"ab"} }
        before{post :create, params: invalid_name2}
        it "should not accept the given name" do
          expect(json).not_to have_http_status(:ok)
        end
      end
    end

  end
  describe "DELETE /destroy" do
    let(:categories) {create_list :category,3  }
    let(:category_id) {categories.first.id}
    before{delete :destroy, params: {id: category_id}}

    it "should return a status code of 204" do
      expect(response).to have_http_status(204)
    end
  end

end
