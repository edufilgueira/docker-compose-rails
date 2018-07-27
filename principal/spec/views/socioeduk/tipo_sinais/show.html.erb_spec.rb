require 'rails_helper'

RSpec.describe "socioeduk/tipo_sinais/show", type: :view do
  before(:each) do
    @socioeduk_tipo_sinal = assign(:socioeduk_tipo_sinal, Socioeduk::TipoSinal.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
