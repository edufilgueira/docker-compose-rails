require 'rails_helper'

RSpec.describe "socioeduk/raca_cores/edit", type: :view do
  before(:each) do
    @socioeduk_raca_cor = assign(:socioeduk_raca_cor, Socioeduk::RacaCor.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit socioeduk_raca_cor form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_raca_cor_path(@socioeduk_raca_cor), "post" do

      assert_select "input[name=?]", "socioeduk_raca_cor[descricao]"
    end
  end
end
