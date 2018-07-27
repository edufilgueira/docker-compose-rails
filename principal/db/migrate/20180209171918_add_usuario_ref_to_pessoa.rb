# frozen_string_literal: true

class AddUsuarioRefToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_reference :pessoas, :usuario, foreign_key: true
  end
end
