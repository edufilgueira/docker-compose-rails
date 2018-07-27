# frozen_string_literal: true

class AddItemPatrimonioRefToPatrimonio < ActiveRecord::Migration[5.1]
  def change
    add_reference :patrimonios, :item_patrimonio, foreign_key: true
  end
end
