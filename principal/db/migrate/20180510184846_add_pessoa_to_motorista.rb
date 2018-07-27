class AddPessoaToMotorista < ActiveRecord::Migration[5.1]
  def change
    add_reference :motoristas, :pessoa, foreign_key: true
  end
end
