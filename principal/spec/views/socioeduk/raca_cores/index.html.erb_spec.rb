require 'rails_helper'

RSpec.describe "socioeduk/raca_cores/index", type: :view do
  before(:each) do
    assign(:socioeduk_raca_cores, [
      Socioeduk::RacaCor.create!(
        :descricao => "Descricao"
      ),
      Socioeduk::RacaCor.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of socioeduk/raca_cores" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
