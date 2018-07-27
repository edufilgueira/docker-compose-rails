# frozen_string_literal: true

class AddRecepcaoToUnidadeSocioeducativa < ActiveRecord::Migration[5.1]
  def change
    add_column :unidades_socioeducativas, :recepcao, :boolean
  end
end
