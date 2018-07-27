# frozen_string_literal: true

class AddColumnGrupoMaterialIdToClasseMateriais < ActiveRecord::Migration[5.1]
  def change
    add_reference :classe_materiais, :grupo_material, foreign_key: true
  end
end
