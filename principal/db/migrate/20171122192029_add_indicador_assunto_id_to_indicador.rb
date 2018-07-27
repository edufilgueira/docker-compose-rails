# frozen_string_literal: true

class AddIndicadorAssuntoIdToIndicador < ActiveRecord::Migration[5.1]
  def change
    add_column :indicadores, :indicador_assunto_id, :int
    add_foreign_key :indicadores, :indicador_assuntos
  end
end
