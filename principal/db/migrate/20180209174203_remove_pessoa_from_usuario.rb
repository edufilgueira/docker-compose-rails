# frozen_string_literal: true

class RemovePessoaFromUsuario < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :usuarios, column: :pessoa_id
    remove_column :usuarios, :pessoa_id, :integer
  end
end
