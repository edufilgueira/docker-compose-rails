# frozen_string_literal: true

json.extract! mapa_de_bordo, :id, :veiculo_id, :tipo_vistoria, :data_vistoria, :responsavel_id, :motorista_id, :km_inicial, :hora_inicial, :km_final, :hora_final, :percurso, :parecer, :created_at, :updated_at
json.url mapa_de_bordo_url(mapa_de_bordo, format: :json)
