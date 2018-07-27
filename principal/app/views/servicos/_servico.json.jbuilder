# frozen_string_literal: true

json.extract! servico, :id, :eixo_id, :nome, :created_at, :updated_at
json.url servico_url(servico, format: :json)
