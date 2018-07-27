require 'rails_helper'

RSpec.describe "socioeduk/cor_olhos/show", type: :view do
  before(:each) do
    @socioeduk_cor_olho = assign(:socioeduk_cor_olho, Socioeduk::CorOlho.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
