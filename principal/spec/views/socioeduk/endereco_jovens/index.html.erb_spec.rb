# require 'rails_helper'

# RSpec.describe "socioeduk/endereco_jovens/index", type: :view do
#   before(:each) do
#     assign(:socioeduk_endereco_jovens, [
#       Socioeduk::EnderecoJovem.create!(
#         :jovem => "MyString",
#         :cidade => "MyString",
#         :rua => "Rua",
#         :numero => "Numero",
#         :complemento => "Complemento",
#         :bairro => "Bairro",
#         :cep => "Cep"
#       ),
#       Socioeduk::EnderecoJovem.create!(
#         :jovem => "MyString",
#         :cidade =>  "MyString",
#         :rua => "Rua",
#         :numero => "Numero",
#         :complemento => "Complemento",
#         :bairro => "Bairro",
#         :cep => "Cep"
#       )
#     ])
#   end

#   it "renders a list of socioeduk/endereco_jovens" do
#     render
#     assert_select "tr>td", :select => "MyString".to_s, :count => 2
#     assert_select "tr>td", :select => "MyString".to_s, :count => 2
#     assert_select "tr>td", :text => "Rua".to_s, :count => 2
#     assert_select "tr>td", :text => "Numero".to_s, :count => 2
#     assert_select "tr>td", :text => "Complemento".to_s, :count => 2
#     assert_select "tr>td", :text => "Bairro".to_s, :count => 2
#     assert_select "tr>td", :text => "Cep".to_s, :count => 2
#   end
# end
