# frozen_string_literal: true

class Material < ApplicationRecord
  audited
  belongs_to :classe_material
  has_one :grupo_material, through: :classe_material
  belongs_to :unidades_medida
  belongs_to :local_armazenamento

  def to_s
    nome
  end
end
