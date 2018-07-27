# frozen_string_literal: true

class AddRecursoshumanosTipoVinculoRefToRecursoshumanosTipoLegal < ActiveRecord::Migration[5.1]
  def change
    add_reference :recursoshumanos_tipo_legais, :recursoshumanos_tipo_vinculo, foreign_key: true, index: { name: 'rec_tipo_legal_tipo_vinculo' }
  end
end
