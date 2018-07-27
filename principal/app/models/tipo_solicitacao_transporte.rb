# frozen_string_literal: true

class TipoSolicitacaoTransporte < ApplicationRecord
  validates_presence_of :tipo

  def to_s
    tipo
  end
end
