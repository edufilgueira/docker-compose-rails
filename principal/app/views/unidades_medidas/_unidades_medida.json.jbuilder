# frozen_string_literal: true

json.extract! unidades_medida, :id, :nome, :sigla, :created_at, :updated_at
json.url unidades_medida_url(unidades_medida, format: :json)
