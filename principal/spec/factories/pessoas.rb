# frozen_string_literal: true

FactoryBot.define do
  factory :pessoa do
    nome 'MyString'
    cpf 'MyString'
    sexo 'M'
    data_contratacao '19/12/2000'
  end

  factory :pessoa_motorista, class: Pessoa do
    nome 'nome_do_motorista'
    cpf '12345678900'
    sexo 'M'
    data_contratacao '19/12/2000'
    funcoes { [FactoryBot.create(:funcao_motorista)] }
  end
end
