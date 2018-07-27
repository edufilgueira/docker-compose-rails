# frozen_string_literal: true

class AddColumnCodigoClasseMaterial < ActiveRecord::Migration[5.1]
  def change
    add_column :classe_materiais, :codigo, :integer
  end
end
