class AddEleitoralToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_column :pessoas, :cidade_eleitoral, :string
    add_column :pessoas, :estado_eleitoral, :string
  end
end
