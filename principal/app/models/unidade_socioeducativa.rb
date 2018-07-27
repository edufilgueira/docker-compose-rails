# frozen_string_literal: true

class UnidadeSocioeducativa < ApplicationRecord
  audited
  acts_as_paranoid
  validates_presence_of :nome, :sigla
  default_scope { order(:sigla, :nome) }

  def sigla_nome
    "#{sigla} - #{nome}"
  end

  def to_s
    sigla_nome
  end
end
