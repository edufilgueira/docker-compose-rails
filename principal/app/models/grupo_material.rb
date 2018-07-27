# frozen_string_literal: true

class GrupoMaterial < ApplicationRecord
  audited
  has_many :classe_materiais
  has_many :materiais

  def to_s
    nome
  end
end
