# frozen_string_literal: true

class AddColumnsToVeiculo < ActiveRecord::Migration[5.1]
  def change
    add_column :veiculos, :ano_fab, :string
    add_column :veiculos, :ano_mod, :string
    add_column :veiculos, :renavam, :string
    add_column :veiculos, :chassi, :string
    add_column :veiculos, :cor, :string
    add_column :veiculos, :lotacao, :string
    add_column :veiculos, :avalicao, :string
  end
end
