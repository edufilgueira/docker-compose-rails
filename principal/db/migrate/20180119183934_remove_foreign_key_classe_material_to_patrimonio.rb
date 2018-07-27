# frozen_string_literal: true

class RemoveForeignKeyClasseMaterialToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :patrimonios, :classe_materiais
  end
end
