require 'rails_helper'

RSpec.describe "Socioeduk::TipoCabelos", type: :request do
  sign_in_user
  describe "GET /socioeduk_tipo_cabelos" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_cabelos_path
      expect(response).to have_http_status(200)
    end
  end
end
