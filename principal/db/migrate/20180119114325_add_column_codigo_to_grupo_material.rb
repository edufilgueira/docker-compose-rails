# frozen_string_literal: true

class AddColumnCodigoToGrupoMaterial < ActiveRecord::Migration[5.1]
  def change
    add_column :grupo_materiais, :codigo, :integer
  end
end
