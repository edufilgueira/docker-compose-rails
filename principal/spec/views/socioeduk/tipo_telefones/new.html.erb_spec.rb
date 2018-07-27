require 'rails_helper'

RSpec.describe "socioeduk/tipo_telefones/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_telefone, Socioeduk::TipoTelefone.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_telefone form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_telefones_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_telefone[descricao]"
    end
  end
end
