require 'rails_helper'

RSpec.describe "socioeduk/jovem_caracteristicas/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_caracteristica, Socioeduk::JovemCaracteristica.new(
      :jovem => nil,
      :tipo_sinal => nil,
      :local_sinal => "MyString",
      :descricao => "MyString"
    ))
  end

  xit "renders new socioeduk_jovem_caracteristica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_caracteristicas_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[tipo_sinal_id]"

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[local_sinal]"

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[descricao]"
    end
  end
end
