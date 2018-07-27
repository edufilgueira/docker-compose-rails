# frozen_string_literal: true

class CreateIndicadores < ActiveRecord::Migration[5.1]
  def change
    create_table :indicadores do |t|
      t.references :indicador_unidade_medida, foreign_key: true
      t.references :area, foreign_key: true
      t.string :melhor_sentido
      t.text :objetivo
      t.string :abrangencia
      t.string :periodicidade_coleta
      t.text :como_coletar
      t.string :periodicidade_avaliacao
      t.text :como_calcular
      t.string :assunto
      t.string :nome

      t.timestamps
    end
  end
end
