# frozen_string_literal: true

class RemoveFatorMultiplicadorToMaterial < ActiveRecord::Migration[5.1]
  def change
    remove_column :materiais, :fator_multiplicador
  end
end
