# frozen_string_literal: true

class CreateGrupoMateriais < ActiveRecord::Migration[5.1]
  def change
    create_table :grupo_materiais do |t|
      t.string :nome

      t.timestamps
    end
  end
end
