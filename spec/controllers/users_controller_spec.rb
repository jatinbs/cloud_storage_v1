require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  fixtures :all

  before do
    @valid_attributes = {
      name: 'test name',
      email: 'test@example.com',
      password: 'test123',
      password_confirmation: 'test123'
    }
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      post :create, {user: @valid_attributes}
      expect(response).to redirect_to(login_path)
    end
  end

  # describe "GET edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
