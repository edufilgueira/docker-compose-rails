require 'rails_helper'

RSpec.describe "socioeduk/cor_olhos/edit", type: :view do
  before(:each) do
    @socioeduk_cor_olho = assign(:socioeduk_cor_olho, Socioeduk::CorOlho.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_cor_olho form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_cor_olho_path(@socioeduk_cor_olho), "post" do

      assert_select "input[name=?]", "socioeduk_cor_olho[descricao]"
    end
  end
end
