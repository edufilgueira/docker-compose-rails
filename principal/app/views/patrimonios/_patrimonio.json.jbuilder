# frozen_string_literal: true

json.extract! patrimonio, :id, :nome, :classe_material_id, :unidades_medida_id, :descricao, :descricao_resumida, :tombo_anterior, :origem_anterior, :tombo_atual, :origem_atual, :created_at, :updated_at
json.url patrimonio_url(patrimonio, format: :json)
