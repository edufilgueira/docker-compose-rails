# frozen_string_literal: true

class UnidadesMedida < ApplicationRecord
  audited
  def to_s
    nome
  end
end
