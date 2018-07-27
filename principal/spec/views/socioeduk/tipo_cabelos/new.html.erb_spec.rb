require 'rails_helper'

RSpec.describe "socioeduk/tipo_cabelos/new", type: :view do
  before(:each) do
    assign(:socioeduk_tipo_cabelo, Socioeduk::TipoCabelo.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_tipo_cabelo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_cabelos_path, "post" do

      assert_select "input[name=?]", "socioeduk_tipo_cabelo[descricao]"
    end
  end
end
