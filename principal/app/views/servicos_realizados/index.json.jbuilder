# frozen_string_literal: true

json.array! @servicos_realizados, partial: 'servicos_realizados/servico_realizado', as: :servico_realizado
