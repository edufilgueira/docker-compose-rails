# frozen_string_literal: true

class AddFormasEntradaToAtendimentoInicial < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_atendimento_iniciais, :forma_entrada, foreign_key: { to_table: :socioeduk_forma_entradas }
    add_reference :socioeduk_atendimento_iniciais, :subforma_entrada, foreign_key: { to_table: :socioeduk_subforma_entradas }
  end
end
