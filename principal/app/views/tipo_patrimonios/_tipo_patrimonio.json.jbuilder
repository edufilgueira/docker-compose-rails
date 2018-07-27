# frozen_string_literal: true

json.extract! tipo_patrimonio, :id, :nome, :created_at, :updated_at
json.url tipo_patrimonio_url(tipo_patrimonio, format: :json)
