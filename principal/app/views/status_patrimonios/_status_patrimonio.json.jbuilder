# frozen_string_literal: true

json.extract! status_patrimonio, :id, :descricao, :created_at, :updated_at
json.url status_patrimonio_url(status_patrimonio, format: :json)
