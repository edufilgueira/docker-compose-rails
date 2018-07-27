require 'rails_helper'

RSpec.describe "socioeduk/situacao_adolescentes/new", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_adolescente, Socioeduk::SituacaoAdolescente.new(
      :descricao => "MyString",
      :remocao_fila => false
    ))
  end

  it "renders new socioeduk_situacao_adolescente form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_adolescentes_path, "post" do

      assert_select "input[name=?]", "socioeduk_situacao_adolescente[descricao]"

      assert_select "input[name=?]", "socioeduk_situacao_adolescente[remocao_fila]"
    end
  end
end
