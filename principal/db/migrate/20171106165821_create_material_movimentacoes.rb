# frozen_string_literal: true

class CreateMaterialMovimentacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :material_movimentacoes do |t|
      t.references :material, foreign_key: true
      t.references :unidade_socioeducativa, foreign_key: true
      t.integer :quantidade_movimentada
      t.string :tipo_movimentacao

      t.timestamps
    end
  end
end
