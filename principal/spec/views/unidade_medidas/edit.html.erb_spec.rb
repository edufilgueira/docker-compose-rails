require 'rails_helper'

RSpec.describe "unidade_medidas/edit", type: :view do
  before(:each) do
    @unidade_medida = assign(:unidade_medida, UnidadeMedida.create!(
      :descricao => "MyString",
      :ativo => false
    ))
  end

  it "renders the edit unidade_medida form" do
    render

    assert_select "form[action=?][method=?]", unidade_medida_path(@unidade_medida), "post" do

      assert_select "input[name=?]", "unidade_medida[descricao]"

      assert_select "input[name=?]", "unidade_medida[ativo]"
    end
  end
end
