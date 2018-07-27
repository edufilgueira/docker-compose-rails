# frozen_string_literal: true

json.extract! socioeduk_admissao, :id, :jovem_id, :unidade_socioeducativa_id, :rebebido_em, :tipo_desligamento_id, :desligado_em, :numero_processo, :created_at, :updated_at
json.url socioeduk_admissao_url(socioeduk_admissao, format: :json)
