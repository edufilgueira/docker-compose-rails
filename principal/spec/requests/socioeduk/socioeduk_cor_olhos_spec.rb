require 'rails_helper'

RSpec.describe "Socioeduk::CorOlhos", type: :request do
  sign_in_user
  describe "GET /socioeduk_cor_olhos" do
    it "works! (now write some real specs)" do
      get socioeduk_cor_olhos_path
      expect(response).to have_http_status(200)
    end
  end
end
