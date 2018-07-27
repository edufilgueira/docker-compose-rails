# frozen_string_literal: true

class CategoriaPatrimonio < ApplicationRecord
  has_many :grupo_patrimonios
  validates :nome, presence: true

  def to_s
    nome
  end
end
