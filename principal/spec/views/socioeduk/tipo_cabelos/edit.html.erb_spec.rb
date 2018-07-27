require 'rails_helper'

RSpec.describe "socioeduk/tipo_cabelos/edit", type: :view do
  before(:each) do
    @socioeduk_tipo_cabelo = assign(:socioeduk_tipo_cabelo, Socioeduk::TipoCabelo.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_tipo_cabelo form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_tipo_cabelo_path(@socioeduk_tipo_cabelo), "post" do

      assert_select "input[name=?]", "socioeduk_tipo_cabelo[descricao]"
    end
  end
end
