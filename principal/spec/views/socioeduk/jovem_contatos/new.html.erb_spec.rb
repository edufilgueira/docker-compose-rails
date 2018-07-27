require 'rails_helper'

RSpec.describe "socioeduk/jovem_contatos/new", type: :view do
  before(:each) do
    assign(:socioeduk_jovem_contato, Socioeduk::JovemContato.new(
      :socioeduk_jovem => nil,
      :socioeduk_tipo_contato => nil,
      :numero => "MyString"
    ))
  end

  xit "renders new socioeduk_jovem_contato form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_jovem_contatos_path, "post" do

      assert_select "input[name=?]", "socioeduk_jovem_contato[socioeduk_jovem_id]"

      assert_select "input[name=?]", "socioeduk_jovem_contato[socioeduk_tipo_contato_id]"

      assert_select "input[name=?]", "socioeduk_jovem_contato[numero]"
    end
  end
end
