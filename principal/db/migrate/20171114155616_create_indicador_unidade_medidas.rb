# frozen_string_literal: true

class CreateIndicadorUnidadeMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :indicador_unidade_medidas do |t|
      t.string :nome
      t.string :sigla

      t.timestamps
    end
  end
end
