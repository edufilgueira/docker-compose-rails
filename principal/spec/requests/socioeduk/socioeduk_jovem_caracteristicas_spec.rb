require 'rails_helper'

RSpec.describe "Socioeduk::JovemCaracteristicas", type: :request do
  sign_in_user
  describe "GET /socioeduk_jovem_caracteristicas" do
    it "works! (now write some real specs)" do
      get socioeduk_jovem_caracteristicas_path
      expect(response).to have_http_status(200)
    end
  end
end
