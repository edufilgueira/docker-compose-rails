# frozen_string_literal: true

class AddDiaToColetaIndicador < ActiveRecord::Migration[5.1]
  def change
    add_column :coleta_indicadores, :dia, :integer
  end
end
