# frozen_string_literal: true

class CreateSolicitacaoTransportes < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitacao_transportes do |t|
      t.references :tipo_solicitacao_transporte, foreign_key: true
      t.references :area, foreign_key: true
      t.integer :destinado_para
      t.date :data_transporte
      t.date :data_retorno
      t.time :hora_solicitada
      t.time :hora_prevista_retorno
      t.string :destino
      t.string :justificativa
      t.boolean :urgente
      t.string :justificativa_urgencia

      t.timestamps
    end
  end
end
