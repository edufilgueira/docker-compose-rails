require 'rails_helper'

RSpec.describe "estados/new", type: :view do
  before(:each) do
    assign(:estado, Estado.new(
      :nome => "MyString",
      :acronym => "MyString",
      :regiao => Regiao.create!(:nome => "Nome")
    ))
  end

#  it "renders new estado form" do
#    render

#    assert_select "form[action=?][method=?]", estados_path, "post" do

#      assert_select "input[name=?]", "estado[nome]"

#      assert_select "input[name=?]", "estado[acronym]"

#      assert_select "input[name=?]", "estado[regiao_id]"
#    end
#  end
end
