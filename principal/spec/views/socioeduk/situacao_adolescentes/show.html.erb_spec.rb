require 'rails_helper'

RSpec.describe "socioeduk/situacao_adolescentes/show", type: :view do
  before(:each) do
    @socioeduk_situacao_adolescente = assign(:socioeduk_situacao_adolescente, Socioeduk::SituacaoAdolescente.create!(
      :descricao => "Descricao",
      :remocao_fila => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/false/)
  end
end
