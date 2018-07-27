# frozen_string_literal: true

class AddSimboloToRecursoshumanosCargo < ActiveRecord::Migration[5.1]
  def change
    add_column :recursoshumanos_cargos, :simbolo, :string
  end
end
