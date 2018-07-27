# frozen_string_literal: true

class AddAreaRefToFuncao < ActiveRecord::Migration[5.1]
  def change
    add_reference :funcoes, :area, foreign_key: true
  end
end
