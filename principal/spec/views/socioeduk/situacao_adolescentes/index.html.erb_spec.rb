require 'rails_helper'

RSpec.describe "socioeduk/situacao_adolescentes/index", type: :view do
  before(:each) do
    assign(:socioeduk_situacao_adolescentes, [
      Socioeduk::SituacaoAdolescente.create!(
        :descricao => "Descricao",
        :remocao_fila => false
      ),
      Socioeduk::SituacaoAdolescente.create!(
        :descricao => "Descricao",
        :remocao_fila => false
      )
    ])
  end

  it "renders a list of socioeduk/situacao_adolescentes" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
