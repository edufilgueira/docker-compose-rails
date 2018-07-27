require 'rails_helper'

RSpec.describe "socioeduk/tipo_cabelos/show", type: :view do
  before(:each) do
    @socioeduk_tipo_cabelo = assign(:socioeduk_tipo_cabelo, Socioeduk::TipoCabelo.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
