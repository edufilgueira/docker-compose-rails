# frozen_string_literal: true

class GestorEixo < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :eixo
  belongs_to :pessoa
  validates_presence_of :eixo_id, :pessoa_id, :data_inicio
  validates_uniqueness_of :eixo_id, message: 'já possui um gestor ativo'
  validates_uniqueness_of :pessoa_id, message: 'já é gestor de um eixo'

  def self.get_by_eixo(eixo_id)
    where(eixo_id: eixo_id)
  end

  def nome_pessoa
    pessoa&.nome
  end
end
