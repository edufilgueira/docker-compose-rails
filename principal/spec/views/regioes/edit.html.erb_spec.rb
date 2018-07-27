require 'rails_helper'

RSpec.describe "regioes/edit", type: :view do
  before(:each) do
    @regiao = assign(:regiao, Regiao.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit regiao form" do
    render

    assert_select "form[action=?][method=?]", regiao_path(@regiao), "post" do

      assert_select "input[name=?]", "regiao[nome]"
    end
  end
end
