# frozen_string_literal: true

class Deposito < ApplicationRecord
  validates :nome, presence: true
  has_many :patrimonios

  def to_s
    nome
  end
end
