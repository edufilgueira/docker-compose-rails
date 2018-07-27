require 'rails_helper'

RSpec.describe "Motoristas", type: :request do
  sign_in_user
  describe "GET /motoristas" do
    it "works! (now write some real specs)" do
      get motoristas_path
      expect(response).to have_http_status(200)
    end
  end
end
