require 'rails_helper'

RSpec.describe "TestObjects", :type => :request do
  describe "GET /test_objects" do
    it "works! (now write some real specs)" do
      get test_objects_path
      expect(response).to have_http_status(200)
    end
  end
end
