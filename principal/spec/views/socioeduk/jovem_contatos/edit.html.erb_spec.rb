require 'rails_helper'

RSpec.describe "socioeduk/jovem_contatos/edit", type: :view do
  before(:each) do
    @socioeduk_jovem_contato = assign(:socioeduk_jovem_contato, Socioeduk::JovemContato.create!(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_contato => nil,
      :numero => "MyString"
    ))
  end

  xit "renders the edit socioeduk_jovem_contato form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_contato_path(@socioeduk_jovem_contato), "post" do

      assert_select "input[name=?]", "socioeduk_jovem_contato[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_contato[socioeduk_tipo_contato_id]"

      assert_select "input[name=?]", "socioeduk_jovem_contato[numero]"
    end
  end
end
