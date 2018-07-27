# frozen_string_literal: true

class ModelosMarca < ApplicationRecord
  belongs_to :marca_veiculo
  has_many :veiculos
end
