# frozen_string_literal: true

FactoryBot.define do
  factory :coleta_indicador do
    indicador
    abrangencia_coleta 'MyString'
    area_id 1
    pessoa_id 1
    indice 'MyString'
    semestre 1
    quadrimestre 1
    trimestre 1
    mes 1
    quinzena 1
    semana 1
    ano 1
    periodo_coleta 'MyString'
  end

  factory :invalid_coleta_indicador, class: ColetaIndicador do
    indicador
    abrangencia_coleta 'MyString'
    area_id 1
    pessoa_id 1
    indice 'MyString'
    semestre 3
    quadrimestre 4
    trimestre 5
    mes 13
    quinzena 26
    semana 54
    ano 142
    periodo_coleta 'MyString'
  end
end
