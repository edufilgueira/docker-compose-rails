# frozen_string_literal: true

json.extract! socioeduk_transferencia, :id, :unidade_socioeducativa_origem_id, :unidade_socioeducativa_destino_id, :admissao_id, :created_at, :updated_at
json.url socioeduk_transferencia_url(socioeduk_transferencia, format: :json)
