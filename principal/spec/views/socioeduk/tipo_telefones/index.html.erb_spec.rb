require 'rails_helper'

RSpec.describe "socioeduk/tipo_telefones/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_telefones, [
      Socioeduk::TipoTelefone.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoTelefone.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_telefones" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
