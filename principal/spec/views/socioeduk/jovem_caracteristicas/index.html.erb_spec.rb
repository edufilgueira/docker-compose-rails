require 'rails_helper'

RSpec.describe "socioeduk/jovem_caracteristicas/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_caracteristicas, [
      Socioeduk::JovemCaracteristica.create!(
        :jovem => nil,
        :tipo_sinal => nil,
        :local_sinal => "Local Sinal",
        :descricao => "Descricao"
      ),
      Socioeduk::JovemCaracteristica.create!(
        :jovem => nil,
        :tipo_sinal => nil,
        :local_sinal => "Local Sinal",
        :descricao => "Descricao"
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_caracteristicas" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Local Sinal".to_s, :count => 2
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
