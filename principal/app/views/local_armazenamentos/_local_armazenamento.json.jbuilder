# frozen_string_literal: true

json.extract! local_armazenamento, :id, :descricao_local, :unidade_socioeducativa_id, :created_at, :updated_at
json.url local_armazenamento_url(local_armazenamento, format: :json)
