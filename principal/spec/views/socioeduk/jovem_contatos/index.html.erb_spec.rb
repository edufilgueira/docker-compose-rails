require 'rails_helper'

RSpec.describe "socioeduk/jovem_contatos/index", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_contatos, [
      Socioeduk::JovemContato.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_contato => nil,
        :numero => "Numero"
      ),
      Socioeduk::JovemContato.create!(
        :socioeduk_jovem => nil,
        :socioeduk_tipo_contato => nil,
        :numero => "Numero"
      )
    ])
  end

  xit "renders a list of socioeduk/jovem_contatos" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
  end
end
