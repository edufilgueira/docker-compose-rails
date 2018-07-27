# frozen_string_literal: true

class RemoveUnidadeMedidaIdToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :patrimonios, column: :unidades_medida_id
    remove_column :patrimonios, :unidades_medida_id
  end
end
