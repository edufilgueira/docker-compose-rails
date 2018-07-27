# frozen_string_literal: true

FactoryBot.define do
  factory :indicador do
    indicador_unidade_medida
    area
    indicador_assunto
    melhor_sentido 'MyString'
    objetivo 'MyText'
    abrangencia 'MyString'
    periodicidade_coleta 'MyString'
    como_coletar 'MyText'
    periodicidade_avaliacao 'MyString'
    como_calcular 'MyText'
    assunto 'MyString'
    nome 'MyString'
  end
end
