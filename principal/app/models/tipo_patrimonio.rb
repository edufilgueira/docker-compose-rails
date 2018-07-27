# frozen_string_literal: true

class TipoPatrimonio < ApplicationRecord
  has_many :item_patrimonios
  validates :nome, presence: true

  def to_s
    nome
  end
end
