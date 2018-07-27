# frozen_string_literal: true

class AddMetaAndDesempenhoMetaToServicoRealizado < ActiveRecord::Migration[5.1]
  def change
    add_column :servicos_realizados, :meta, :integer
    add_column :servicos_realizados, :desempenho_meta, :decimal, precision: 8, scale: 2
  end
end
