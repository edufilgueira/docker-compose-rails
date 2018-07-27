# frozen_string_literal: true

class RenameClasseMaterialIdToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    rename_column :patrimonios, :classe_material_id, :classe_patrimonio_id
  end
end
