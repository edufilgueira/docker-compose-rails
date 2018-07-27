# frozen_string_literal: true

class RemoveGrupoMaterialIdToMaterial < ActiveRecord::Migration[5.1]
  def change
    remove_column :materiais, :grupo_material_id
  end
end
