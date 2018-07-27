require 'rails_helper'

RSpec.describe "socioeduk/cor_olhos/index", type: :view do
  before(:each) do
    assign(:socioeduk_cor_olhos, [
      Socioeduk::CorOlho.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::CorOlho.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/cor_olhos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
