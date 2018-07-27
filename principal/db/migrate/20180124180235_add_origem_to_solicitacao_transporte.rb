# frozen_string_literal: true

class AddOrigemToSolicitacaoTransporte < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_transportes, :origem, :string
  end
end
