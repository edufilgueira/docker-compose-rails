# frozen_string_literal: true

json.extract! indicador_unidade_medida, :id, :nome, :sigla, :created_at, :updated_at
json.url indicador_unidade_medida_url(indicador_unidade_medida, format: :json)
