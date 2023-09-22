require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET /index" do
    context "checking the endpoint routing" do
      subject{get :index}
      it "should route to the books" do
        subject
        expect(get: '/books').to route_to("books#index")
      end
      it "should return a status code of 200." do
        expect(response).to have_http_status(200)
      end
    end
    context "checking proper json data" do
      subject{get :index}
      it "should return proper json" do
        create_list :book, 3
        subject
        pp json
        expect(json.class).to eq(Hash)
        expect(json).not_to be_empty
        expect(json_data.length).to eq(3)
      end
    end


  end
end
