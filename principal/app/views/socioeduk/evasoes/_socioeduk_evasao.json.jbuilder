# frozen_string_literal: true

json.extract! socioeduk_evasao, :id, :jovem_id, :data_evasao, :evadido, :retornou_em, :tipo_evasao, :observacoes, :motivo, :created_at, :updated_at
json.url socioeduk_evasao_url(socioeduk_evasao, format: :json)
