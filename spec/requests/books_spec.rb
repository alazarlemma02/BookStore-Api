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
        expect(json.class).to eq(Hash)
        expect(json).not_to be_empty
        expect(json_data.length).to eq(3)
      end
    end
  end

  describe "POST /create" do
    context "when the request is valid" do
      let(:categories){create_list :category, 2}
      let(:valid_book) {{title:"some title", author:"some author", category_id: categories.first.id}}
      before{post :create, params: valid_book}
      it "should have a status code of 201" do
        expect(response).to have_http_status(201)
      end
      it "should validate the title lenght before sending the data" do
        expect(json_data['title'].length).to be >=3
      end
      #wirtte a test to check if the sent data and what you wrote are the same.
    end
    context "when the request is invalid" do
      let(:categories){create_list :category, 2}
      let(:valid_book) {{title:"", author:"some author", category_id: categories.first.id}}
      before{post :create, params: valid_book}

      it "should not accept the given empty title" do
        expect(response).not_to have_http_status(:ok)
      end
    end


  end
  describe 'DELETE /destroy' do

    let(:books){create_list :book,3}
    let(:book_id){books.first.id}
    before{delete :destroy, params:{id: book_id}}
    it "should have a status code of 204" do
      expect(response).to have_http_status(204)
    end

  end

end
