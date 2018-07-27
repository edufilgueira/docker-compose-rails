# require 'rails_helper'

# RSpec.describe "socioeduk/endereco_jovens/new", type: :view do
#   before(:each) do
#     assign(:socioeduk_endereco_jovem, Socioeduk::EnderecoJovem.new(
#       :jovem => "MyString",
#       :cidade => "MyString",
#       :rua => "MyString",
#       :numero => "MyString",
#       :complemento => "MyString",
#       :bairro => "MyString",
#       :cep => "MyString"
#     ))
#   end

#   it "renders new socioeduk_endereco_jovem form" do
#     render

#     assert_select "form[action=?][method=?]", socioeduk_endereco_jovens_path, "post" do

#       assert_select "select[name=?]", "socioeduk_endereco_jovem[jovem_id]"

#       assert_select "select[name=?]", "socioeduk_endereco_jovem[cidade_id]"

#       assert_select "input[name=?]", "socioeduk_endereco_jovem[rua]"

#       assert_select "input[name=?]", "socioeduk_endereco_jovem[numero]"

#       assert_select "input[name=?]", "socioeduk_endereco_jovem[complemento]"

#       assert_select "input[name=?]", "socioeduk_endereco_jovem[bairro]"

#       assert_select "input[name=?]", "socioeduk_endereco_jovem[cep]"
#     end
#   end
# end
