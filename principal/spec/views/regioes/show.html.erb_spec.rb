require 'rails_helper'

RSpec.describe "regioes/show", type: :view do
  before(:each) do
    @regiao = assign(:regiao, Regiao.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
