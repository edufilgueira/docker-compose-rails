# frozen_string_literal: true

class GestorArea < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :area
  belongs_to :pessoa
  validates_presence_of :area_id, :pessoa_id, :data_inicio
  validates_uniqueness_of :area_id, message: 'já possui um gestor ativo'
  validates_uniqueness_of :pessoa_id, message: 'já é gestor de uma área'

  def self.get_by_area(area_id)
    where(area_id: area_id)
  end

  def nome_pessoa
    pessoa&.nome
  end
end
