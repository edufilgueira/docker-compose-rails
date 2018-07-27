# frozen_string_literal: true

class AddLocalArmazenamentoRefToMaterial < ActiveRecord::Migration[5.1]
  def change
    add_reference :materiais, :local_armazenamento, foreign_key: true
  end
end
