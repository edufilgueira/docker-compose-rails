# frozen_string_literal: true

class CreateServicosRealizados < ActiveRecord::Migration[5.1]
  def change
    create_table :servicos_realizados do |t|
      t.references :eixo, foreign_key: true
      t.references :gestor_eixo, foreign_key: true
      t.references :unidade_socioeducativa, foreign_key: true
      t.references :gestor_unidade, foreign_key: true
      t.references :area, foreign_key: true
      t.references :gestor_area, foreign_key: true
      t.references :socioeducando_atendido, foreign_key: true
      t.references :servico, foreign_key: true
      t.integer :quantidade_realizados

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
