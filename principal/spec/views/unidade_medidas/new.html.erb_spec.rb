require 'rails_helper'

RSpec.describe "unidade_medidas/new", type: :view do
  before(:each) do
    assign(:unidade_medida, UnidadeMedida.new(
      :descricao => "MyString",
      :ativo => false
    ))
  end

  it "renders new unidade_medida form" do
    render

    assert_select "form[action=?][method=?]", unidade_medidas_path, "post" do

      assert_select "input[name=?]", "unidade_medida[descricao]"

      assert_select "input[name=?]", "unidade_medida[ativo]"
    end
  end
end
