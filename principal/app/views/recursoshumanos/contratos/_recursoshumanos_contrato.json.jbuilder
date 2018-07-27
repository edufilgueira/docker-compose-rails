# frozen_string_literal: true

json.extract! recursoshumanos_contrato, :id, :recursoshumanos_tipo_legal_id, :recursoshumanos_tipo_vinculo_id, :inicio, :numero, :ano, :doe_ce, :data_doe_ce, :pagina_doe_ce, :inicio_vigencia, :final_vigencia, :created_at, :updated_at
json.url recursoshumanos_contrato_url(recursoshumanos_contrato, format: :json)
