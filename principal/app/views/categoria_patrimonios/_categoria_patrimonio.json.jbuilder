# frozen_string_literal: true

json.extract! categoria_patrimonio, :id, :nome, :created_at, :updated_at
json.url categoria_patrimonio_url(categoria_patrimonio, format: :json)
