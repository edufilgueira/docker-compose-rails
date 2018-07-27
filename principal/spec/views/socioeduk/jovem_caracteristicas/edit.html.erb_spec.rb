require 'rails_helper'

RSpec.describe "socioeduk/jovem_caracteristicas/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_caracteristica = assign(:socioeduk_jovem_caracteristica, Socioeduk::JovemCaracteristica.create!(
      :jovem => nil,
      :tipo_sinal => nil,
      :local_sinal => "MyString",
      :descricao => "MyString"
    ))
  end

  xit "renders the edit socioeduk_jovem_caracteristica form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_caracteristica_path(@socioeduk_jovem_caracteristica), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[tipo_sinal_id]"

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[local_sinal]"

      assert_select "input[name=?]", "socioeduk_jovem_caracteristica[descricao]"
    end
  end
end