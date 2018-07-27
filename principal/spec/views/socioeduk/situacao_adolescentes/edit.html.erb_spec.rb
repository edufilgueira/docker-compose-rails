require 'rails_helper'

RSpec.describe "socioeduk/situacao_adolescentes/edit", type: :view do
  before(:each) do
    @socioeduk_situacao_adolescente = assign(:socioeduk_situacao_adolescente, Socioeduk::SituacaoAdolescente.create!(
      :descricao => "MyString",
      :remocao_fila => false
    ))
  end

  it "renders the edit socioeduk_situacao_adolescente form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_situacao_adolescente_path(@socioeduk_situacao_adolescente), "post" do

      assert_select "input[name=?]", "socioeduk_situacao_adolescente[descricao]"

      assert_select "input[name=?]", "socioeduk_situacao_adolescente[remocao_fila]"
    end
  end
end
