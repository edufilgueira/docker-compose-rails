require 'rails_helper'

RSpec.describe "socioeduk/tipo_telefones/show", type: :view do
  before(:each) do
    @socioeduk_tipo_telefone = assign(:socioeduk_tipo_telefone, Socioeduk::TipoTelefone.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
