# frozen_string_literal: true

json.extract! item_patrimonio, :id, :classe_patrimonio_id, :tipo_patrimonio_id, :nome, :descricao, :created_at, :updated_at
json.url item_patrimonio_url(item_patrimonio, format: :json)
