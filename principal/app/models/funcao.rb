# frozen_string_literal: true

class Funcao < ApplicationRecord
  belongs_to :area
  has_many :funcao_pessoas
  has_many :pessoas, through: :funcao_pessoas

  def to_s
    nome
  end
end
