# frozen_string_literal: true

module SolicitacaoTransportesHelper
  def boolean_convert(params)
    'Urgente' if params
  end
end
