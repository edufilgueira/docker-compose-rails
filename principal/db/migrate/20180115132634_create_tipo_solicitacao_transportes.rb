# frozen_string_literal: true

class CreateTipoSolicitacaoTransportes < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_solicitacao_transportes do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
