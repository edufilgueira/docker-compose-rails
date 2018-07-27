require 'rails_helper'

RSpec.describe "socioeduk/jovem_caracteristicas/show", type: :view do
  before(:each) do
    @socioeduk_jovem_caracteristica = assign(:socioeduk_jovem_caracteristica, Socioeduk::JovemCaracteristica.create!(
      :jovem => nil,
      :tipo_sinal => nil,
      :local_sinal => "Local Sinal",
      :descricao => "Descricao"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Local Sinal/)
    expect(rendered).to match(/Descricao/)
  end
end
