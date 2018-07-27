require 'rails_helper'

RSpec.describe "Socioeduk::RacaCores", type: :request do
  sign_in_user
  describe "GET /socioeduk_raca_cores" do
    it "works! (now write some real specs)" do
      get socioeduk_raca_cores_path
      expect(response).to have_http_status(200)
    end
  end
end
