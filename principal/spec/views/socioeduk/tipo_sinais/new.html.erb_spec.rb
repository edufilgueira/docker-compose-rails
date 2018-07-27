require 'rails_helper'

RSpec.describe "socioeduk/tipo_sinais/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_sinal, Socioeduk::TipoSinal.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_sinal form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_sinais_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_sinal[descricao]"
    end
  end
end
