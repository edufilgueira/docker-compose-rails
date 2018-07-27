# frozen_string_literal: true

class AddCategoriaPatrimonioIdRefToGrupoPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_reference :grupo_patrimonios, :categoria_patrimonio, foreign_key: true
  end
end
