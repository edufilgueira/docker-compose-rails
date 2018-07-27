# frozen_string_literal: true

class AddQuantidadeToMaterial < ActiveRecord::Migration[5.1]
  def change
    add_column :materiais, :quantidade, :decimal
  end
end
