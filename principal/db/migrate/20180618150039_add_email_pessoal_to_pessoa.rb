class AddEmailPessoalToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_column :pessoas, :email_pessoal, :string 
  end
end
