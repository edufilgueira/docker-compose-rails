require 'rails_helper'

RSpec.describe "Socioeduk::SituacaoAdolescentes", type: :request do
  sign_in_user
  describe "GET /socioeduk_situacao_adolescentes" do
    it "works! (now write some real specs)" do
      get socioeduk_situacao_adolescentes_path
      expect(response).to have_http_status(200)
    end
  end
end
