# frozen_string_literal: true

class RemoveColumnClasseMaterialIdToGrupoMateriais < ActiveRecord::Migration[5.1]
  def change
    remove_column :grupo_materiais, :classe_material_id
  end
end
