# frozen_string_literal: true

class AddStatusPatrimonioRefDepositoRefToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_reference :patrimonios, :status_patrimonio, foreign_key: true
    add_reference :patrimonios, :deposito, foreign_key: true
  end
end
