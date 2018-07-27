# frozen_string_literal: true

json.extract! eixo, :id, :nome, :created_at, :updated_at
json.url eixo_url(eixo, format: :json)
