# frozen_string_literal: true

json.extract! grupo_patrimonio, :id, :codigo, :nome, :created_at, :updated_at
json.url grupo_patrimonio_url(grupo_patrimonio, format: :json)
