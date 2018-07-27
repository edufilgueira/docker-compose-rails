# frozen_string_literal: true

class AddJovemToEndereco < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_enderecos, :jovem, foreign_key: { to_table: :socioeduk_jovens }
  end
end
