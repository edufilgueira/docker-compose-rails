# frozen_string_literal: true

class IndicadorUnidadeMedida < ApplicationRecord
  def to_s
    nome
  end
end
