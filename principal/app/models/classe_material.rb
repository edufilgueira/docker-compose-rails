# frozen_string_literal: true

class ClasseMaterial < ApplicationRecord
  audited
  belongs_to :grupo_material
  has_many :materiais

  def to_s
    nome
  end
end
