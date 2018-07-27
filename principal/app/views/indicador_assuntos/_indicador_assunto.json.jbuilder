# frozen_string_literal: true

json.extract! indicador_assunto, :id, :nome, :created_at, :updated_at
json.url indicador_assunto_url(indicador_assunto, format: :json)
