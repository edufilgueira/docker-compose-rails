# frozen_string_literal: true

class CreateColetaIndicadores < ActiveRecord::Migration[5.1]
  def change
    create_table :coleta_indicadores do |t|
      t.references :indicador, foreign_key: true
      t.string :abrangencia_coleta
      t.integer :area_id
      t.integer :pessoa_id
      t.string :indice
      t.integer :semestre
      t.integer :quadrimestre
      t.integer :trimestre
      t.integer :mes
      t.integer :quinzena
      t.integer :semana
      t.integer :ano
      t.string :periodo_coleta

      t.timestamps
    end
  end
end
