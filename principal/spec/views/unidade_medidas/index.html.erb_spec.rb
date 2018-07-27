require 'rails_helper'

RSpec.describe "unidade_medidas/index", type: :view do
  before(:each) do
    assign(:unidade_medidas, [
      UnidadeMedida.create!(
        :descricao => "Descricao",
        :ativo => false
      ),
      UnidadeMedida.create!(
        :descricao => "Descricao",
        :ativo => false
      )
    ])
  end

  it "renders a list of unidade_medidas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
