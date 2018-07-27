require 'rails_helper'

RSpec.describe "cidades/edit", type: :view do
  before(:each) do
    @cidade = assign(:cidade, Cidade.create!(
      :nome => "MyString",
      :capital => false,
      :estado => Estado.create!(:nome => "MyString", :acronym => "MyString", :regiao => Regiao.create!(:nome => "Nome"))
    ))
  end

#  it "renders the edit cidade form" do
#    render

#    assert_select "form[action=?][method=?]", cidade_path(@cidade), "post" do

#      assert_select "input[name=?]", "cidade[nome]"

#      assert_select "input[name=?]", "cidade[capital]"

#      assert_select "input[name=?]", "cidade[estado_id]"
#    end
#  end
end
