require 'rails_helper'

RSpec.describe "estados/edit", type: :view do
  before(:each) do
    @estado = assign(:estado, Estado.create!(
      :nome => "MyString",
      :acronym => "MyString",
      :regiao => Regiao.create!(:nome => "Nome")
    ))
  end

#  it "renders the edit estado form" do
#    render

#    assert_select "form[action=?][method=?]", estado_path(@estado), "post" do

#      assert_select "input[name=?]", "estado[nome]"

#      assert_select "input[name=?]", "estado[acronym]"

#      assert_select "input[name=?]", "estado[regiao_id]"
#    end
#  end
end
