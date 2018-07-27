require 'rails_helper'

RSpec.describe "Regioes", type: :request do
  sign_in_user
  describe "GET /regioes" do
    it "works! (now write some real specs)" do
      get regioes_path
      expect(response).to have_http_status(200)
    end
  end
end
