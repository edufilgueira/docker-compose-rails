require 'rails_helper'

RSpec.describe "Socioeduk::TipoTelefones", type: :request do
  sign_in_user
  describe "GET /socioeduk_tipo_telefones" do
    it "works! (now write some real specs)" do
      get socioeduk_tipo_telefones_path
      expect(response).to have_http_status(200)
    end
  end
end
