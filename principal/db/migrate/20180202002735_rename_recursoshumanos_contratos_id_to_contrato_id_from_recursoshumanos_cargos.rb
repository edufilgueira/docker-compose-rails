# frozen_string_literal: true

class RenameRecursoshumanosContratosIdToContratoIdFromRecursoshumanosCargos < ActiveRecord::Migration[5.1]
  def change
    change_table :recursoshumanos_cargos do |t|
      t.rename :recursoshumanos_contratos_id, :contrato_id
    end
  end
end
