# frozen_string_literal: true

class AddAnoMesToServicoRealizado < ActiveRecord::Migration[5.1]
  def change
    add_column :servicos_realizados, :ano, :integer
    add_column :servicos_realizados, :mes, :integer
  end
end
