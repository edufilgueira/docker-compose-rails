FactoryBot.define do
  factory :socioeduk_endereco_jovem, class: 'Socioeduk::EnderecoJovem' do
    jovem nil
    cidade nil
    rua "MyString"
    numero "MyString"
    complemento "MyString"
    bairro "MyString"
    cep "MyString"
  end
end
