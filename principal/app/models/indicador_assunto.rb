# frozen_string_literal: true

class IndicadorAssunto < ApplicationRecord
  def to_s
    nome
  end
end
