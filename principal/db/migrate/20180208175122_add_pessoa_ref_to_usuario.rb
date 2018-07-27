# frozen_string_literal: true

class AddPessoaRefToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_reference :usuarios, :pessoa, foreign_key: true
  end
end
