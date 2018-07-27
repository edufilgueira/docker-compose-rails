# frozen_string_literal: true

json.extract! classe_patrimonio, :id, :grupo_patrimonio_id, :codigo, :nome, :created_at, :updated_at
json.url classe_patrimonio_url(classe_patrimonio, format: :json)
