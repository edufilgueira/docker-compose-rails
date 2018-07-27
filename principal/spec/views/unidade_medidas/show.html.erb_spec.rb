require 'rails_helper'

RSpec.describe "unidade_medidas/show", type: :view do
  before(:each) do
    @unidade_medida = assign(:unidade_medida, UnidadeMedida.create!(
      :descricao => "Descricao",
      :ativo => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/false/)
  end
end
