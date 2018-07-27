# frozen_string_literal: true

json.extract! socioeduk_contato, :id, :jovem_id, :tipo_contato_id, :ddd, :numero, :created_at, :updated_at
json.url socioeduk_contato_url(socioeduk_contato, format: :json)
