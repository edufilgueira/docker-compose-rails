# frozen_string_literal: true

class ClassePatrimonio < ApplicationRecord
  belongs_to :grupo_patrimonio
  has_many :item_patrimonios
  validates :codigo, :nome, presence: true

  def to_s
    nome
  end

  def self.buscar_classes_grupo(grupo_patrimonio_id)
    where(grupo_patrimonio_id: grupo_patrimonio_id)
  end
end
