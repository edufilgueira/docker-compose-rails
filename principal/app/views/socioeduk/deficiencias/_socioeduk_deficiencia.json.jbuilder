# frozen_string_literal: true

json.extract! socioeduk_deficiencia, :id, :jovem_id, :deficiencias_id, :created_at, :updated_at
json.url socioeduk_deficiencia_url(socioeduk_deficiencia, format: :json)
