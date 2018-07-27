require 'rails_helper'

RSpec.describe "estados/show", type: :view do
  before(:each) do
    @estado = assign(:estado, Estado.create!(
      :nome => "Nome",
      :acronym => "Acronym",
      :regiao => Regiao.create!(:nome => "Nome")
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Acronym/)
    expect(rendered).to match(//)
  end
end
