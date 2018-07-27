# frozen_string_literal: true

class AddClasseMaterialIdToGrupoMaterial < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_materiais, :classe_material_id, :integer
  end
end
