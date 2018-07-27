# frozen_string_literal: true

class SolicitacaoTransporte < ApplicationRecord
  belongs_to :tipo_solicitacao_transporte
  belongs_to :area
  belongs_to :destinado_para, class_name: 'Pessoa', foreign_key: 'destinado_para_id'
end
