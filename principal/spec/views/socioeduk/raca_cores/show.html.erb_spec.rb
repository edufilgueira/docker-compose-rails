require 'rails_helper'

RSpec.describe "socioeduk/raca_cores/show", type: :view do
  before(:each) do
    @socioeduk_raca_cor = assign(:socioeduk_raca_cor, Socioeduk::RacaCor.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
