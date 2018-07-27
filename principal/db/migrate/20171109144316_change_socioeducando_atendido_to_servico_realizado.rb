# frozen_string_literal: true

class ChangeSocioeducandoAtendidoToServicoRealizado < ActiveRecord::Migration[5.1]
  def change
    rename_column :servicos_realizados, :socioeducando_atendido_id, :qtd_socioeducandos_atendidos
  end
end
