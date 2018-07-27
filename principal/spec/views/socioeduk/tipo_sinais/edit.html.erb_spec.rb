require 'rails_helper'

RSpec.describe "socioeduk/tipo_sinais/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_sinal = assign(:socioeduk_tipo_sinal, Socioeduk::TipoSinal.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_sinal form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_sinal_path(@socioeduk_tipo_sinal), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_sinal[descricao]"
    end
  end
end
