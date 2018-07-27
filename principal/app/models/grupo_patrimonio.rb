# frozen_string_literal: true

class GrupoPatrimonio < ApplicationRecord
  has_many :classe_patrimonios
  belongs_to :categoria_patrimonio, required: false
  validates :codigo, :nome, presence: true

  def to_s
    nome
  end
end
