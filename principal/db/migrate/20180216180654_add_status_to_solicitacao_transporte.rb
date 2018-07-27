# frozen_string_literal: true

class AddStatusToSolicitacaoTransporte < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_transportes, :status, :string
  end
end
