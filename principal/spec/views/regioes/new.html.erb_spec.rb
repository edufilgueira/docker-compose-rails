require 'rails_helper'

RSpec.describe "regioes/new", type: :view do
  before(:each) do
    assign(:regiao, Regiao.new(
      :nome => "MyString"
    ))
  end

  it "renders new regiao form" do
    render

    assert_select "form[action=?][method=?]", regioes_path, "post" do

      assert_select "input[name=?]", "regiao[nome]"
    end
  end
end
