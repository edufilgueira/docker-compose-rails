# frozen_string_literal: true

json.extract! servico_realizado, :id, :eixo_id, :gestor_eixo_id, :unidade_socioeducativa_id, :gestor_unidade_id, :area_id, :gestor_area_id, :qtd_socioeducandos_atendidos, :servico_id, :quantidade_realizados, :created_at, :updated_at
json.url servico_realizado_url(servico_realizado, format: :json)
