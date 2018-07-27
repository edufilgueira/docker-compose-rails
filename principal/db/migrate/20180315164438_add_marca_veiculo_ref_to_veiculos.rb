# frozen_string_literal: true

class AddMarcaVeiculoRefToVeiculos < ActiveRecord::Migration[5.1]
  def change
    add_reference :veiculos, :marca_veiculo, foreign_key: true
  end
end
