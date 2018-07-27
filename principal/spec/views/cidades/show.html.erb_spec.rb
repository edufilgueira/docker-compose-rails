require 'rails_helper'

RSpec.describe "cidades/show", type: :view do
  before(:each) do
    @cidade = assign(:cidade, Cidade.create!(
      :nome => "Nome",
      :capital => false,
      :estado => Estado.create!(:nome => "MyString", :acronym => "MyString", :regiao => Regiao.create!(:nome => "Nome"))
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
