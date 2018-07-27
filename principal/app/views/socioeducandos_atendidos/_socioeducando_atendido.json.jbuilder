# frozen_string_literal: true

json.extract! socioeducando_atendido, :id, :ano, :mes, :unidade_socioeducativa_id, :quantidade, :created_at, :updated_at
json.url socioeducando_atendido_url(socioeducando_atendido, format: :json)
