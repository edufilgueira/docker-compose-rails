require 'rails_helper'

RSpec.describe "socioeduk/tipo_cabelos/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_cabelos, [
      Socioeduk::TipoCabelo.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoCabelo.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_cabelos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
