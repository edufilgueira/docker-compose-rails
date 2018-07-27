# frozen_string_literal: true

class CapacidadeDiaria < ApplicationRecord
  audited
  belongs_to :unidade_socioeducativa
  belongs_to :usuario
  validates_presence_of :capacidade, :unidade_socioeducativa_id
  validates_numericality_of :capacidade
  default_scope { order(:data_referencia) }
end
