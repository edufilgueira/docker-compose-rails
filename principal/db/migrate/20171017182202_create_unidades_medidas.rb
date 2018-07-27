# frozen_string_literal: true

class CreateUnidadesMedidas < ActiveRecord::Migration[5.1]
  def change
    create_table :unidades_medidas do |t|
      t.string :nome
      t.string :sigla

      t.timestamps
    end
  end
end
