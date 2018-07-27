require 'rails_helper'

RSpec.describe "socioeduk/tipo_sinais/index", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_sinais, [
      Socioeduk::TipoSinal.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::TipoSinal.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/tipo_sinais" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
