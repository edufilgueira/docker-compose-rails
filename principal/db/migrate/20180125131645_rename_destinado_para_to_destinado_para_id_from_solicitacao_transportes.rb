# frozen_string_literal: true

class RenameDestinadoParaToDestinadoParaIdFromSolicitacaoTransportes < ActiveRecord::Migration[5.1]
  def change
    change_table :solicitacao_transportes do |t|
      t.rename :destinado_para, :destinado_para_id
    end
  end
end
