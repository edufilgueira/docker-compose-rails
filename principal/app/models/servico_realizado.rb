# frozen_string_literal: true

class ServicoRealizado < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :eixo
  belongs_to :gestor_eixo
  belongs_to :unidade_socioeducativa
  belongs_to :gestor_unidade
  belongs_to :area
  belongs_to :gestor_area
  belongs_to :servico
  validates_presence_of :eixo_id, :gestor_eixo_id, :unidade_socioeducativa_id, :gestor_unidade_id, :area_id, :gestor_area_id, :qtd_socioeducandos_atendidos, :servico_id, :quantidade_realizados
  validates_numericality_of :quantidade_realizados
  # validates_uniqueness_of :quantidade_realizados, scope: [ :unidade_socioeducativa_id, :ano, :mes ], message: 'Já existente para este ano e mês'
  validate :calcula_desempenho

  def calcula_desempenho
    self.desempenho_meta = (quantidade_realizados.to_f / meta.to_f) * 100 if meta.present?
  end
end
