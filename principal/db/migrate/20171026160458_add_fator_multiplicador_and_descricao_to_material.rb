# frozen_string_literal: true

class AddFatorMultiplicadorAndDescricaoToMaterial < ActiveRecord::Migration[5.1]
  def change
    add_column :materiais, :descricao, :text
    add_column :materiais, :fator_multiplicador, :integer
  end
end
