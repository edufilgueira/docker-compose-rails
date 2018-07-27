require 'rails_helper'

RSpec.describe "socioeduk/raca_cores/new", type: :view do
  before(:each) do
    assign(:socioeduk_raca_cor, Socioeduk::RacaCor.new(
      :descricao => "MyString"
    ))
  end

  it "renders new socioeduk_raca_cor form" do
    render

    assert_select "form[action=?][method=?]", socioeduk_raca_cores_path, "post" do

      assert_select "input[name=?]", "socioeduk_raca_cor[descricao]"
    end
  end
end
