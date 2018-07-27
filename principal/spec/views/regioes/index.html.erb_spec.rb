require 'rails_helper'

RSpec.describe "regioes/index", type: :view do
  before(:each) do
    assign(:regioes, [
      Regiao.create!(
        :nome => "Nome"
      ),
      Regiao.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of regioes" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
