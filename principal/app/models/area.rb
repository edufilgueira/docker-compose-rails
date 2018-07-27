# frozen_string_literal: true

class Area < ApplicationRecord
  audited
  acts_as_paranoid
  validates_presence_of :nome, :sigla
  belongs_to :subarea, class_name: 'Area', foreign_key: 'subarea_id', required: false
  belongs_to :unidade_socioeducativa, required: false
  default_scope { order(:sigla, :nome) }
  has_many :funcoes
  has_many :patrimonios
  
  def sigla_nome
    "#{sigla} - #{nome}"
  end

  def to_s
    nome
  end

  def self.buscar_areas(unidade_socioeducativa_id)
    where(unidade_socioeducativa_id: unidade_socioeducativa_id)
  end

  def self.buscar_subareas(area_id)
    where(subarea_id: area_id)
  end
end
