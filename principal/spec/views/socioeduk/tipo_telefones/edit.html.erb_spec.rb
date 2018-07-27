require 'rails_helper'

RSpec.describe "socioeduk/tipo_telefones/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_telefone = assign(:socioeduk_tipo_telefone, Socioeduk::TipoTelefone.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_telefone form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_telefone_path(@socioeduk_tipo_telefone), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_telefone[descricao]"
    end
  end
end
