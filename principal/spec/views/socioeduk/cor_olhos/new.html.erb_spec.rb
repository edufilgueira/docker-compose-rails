require 'rails_helper'

RSpec.describe "socioeduk/cor_olhos/new", type: :view do
  before(:each) do
    assign(:socioeduk_cor_olho, Socioeduk::CorOlho.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_cor_olho form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_cor_olhos_path, "post" do

      assert_select "input[name=?]", "socioeduk_cor_olho[descricao]"
    end
  end
end
