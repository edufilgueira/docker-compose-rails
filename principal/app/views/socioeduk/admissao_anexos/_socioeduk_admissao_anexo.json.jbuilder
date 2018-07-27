# frozen_string_literal: true

json.extract! socioeduk_admissao_anexo, :id, :jovem_id, :kit, :documentos, :created_at, :updated_at
json.url socioeduk_admissao_anexo_url(socioeduk_admissao_anexo, format: :json)
