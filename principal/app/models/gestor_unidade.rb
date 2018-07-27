# frozen_string_literal: true

class GestorUnidade < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :unidade_socioeducativa
  belongs_to :pessoa
  validates_presence_of :unidade_socioeducativa_id, :pessoa_id, :data_inicio
  validates_uniqueness_of :unidade_socioeducativa_id, message: 'já possui um gestor ativo'
  validates_uniqueness_of :pessoa_id, message: 'já é gestor de uma unidade'

  def self.get_by_unidade(unidade_id)
    where(unidade_socioeducativa_id: unidade_id)
  end

  def nome_pessoa
    pessoa&.nome
  end
end
