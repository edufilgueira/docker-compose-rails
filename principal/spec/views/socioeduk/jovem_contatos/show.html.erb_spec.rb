require 'rails_helper'

RSpec.describe "socioeduk/jovem_contatos/show", type: :view do
  before(:each) do
    @socioeduk_jovem_contato = assign(:socioeduk_jovem_contato, Socioeduk::JovemContato.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_contato => nil,
      :numero => "Numero"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Numero/)
  end
end
