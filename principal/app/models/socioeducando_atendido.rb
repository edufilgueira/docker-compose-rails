# frozen_string_literal: true

class SocioeducandoAtendido < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :unidade_socioeducativa
  validates_presence_of :unidade_socioeducativa_id, :quantidade, :ano, :mes
  validates_numericality_of :quantidade, only_integer: true
  validates_numericality_of :mes, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12
  validates_numericality_of :ano, only_integer: true, greater_than_or_equal_to: 2000, less_than_or_equal_to: 2050
  # default_scope { includes(:unidade_socioeducativa).order("unidades_socioeducativas.nome, mes, ano desc") }
  # default_scope { order("mes, ano desc") }
end
