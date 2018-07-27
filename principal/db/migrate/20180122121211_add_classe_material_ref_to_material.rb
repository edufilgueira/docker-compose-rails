# frozen_string_literal: true

class AddClasseMaterialRefToMaterial < ActiveRecord::Migration[5.1]
  def change
    add_reference :materiais, :classe_material, foreign_key: true
  end
end
