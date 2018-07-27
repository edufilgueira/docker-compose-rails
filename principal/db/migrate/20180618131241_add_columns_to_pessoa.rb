class AddColumnsToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_column :pessoas, :nome_pai, :string 
    add_column :pessoas, :nome_mae, :string
    add_column :pessoas, :estado_civil, :string
    add_column :pessoas, :conjuge, :string
    add_column :pessoas, :profissao, :string
    add_column :pessoas, :data_nascimento, :date
    add_column :pessoas, :naturalidade, :string
    add_column :pessoas, :uf, :string
    add_column :pessoas, :tipo_sanguineo, :string
    add_column :pessoas, :sexo, :string
    add_column :pessoas, :rua, :string
    add_column :pessoas, :numero, :string
    add_column :pessoas, :complemento, :string
    add_column :pessoas, :bairro, :string
    add_column :pessoas, :cidade, :string
    add_column :pessoas, :estado, :string
    add_column :pessoas, :cep, :string
    add_column :pessoas, :telefone, :string
    add_column :pessoas, :celular, :string
    add_column :pessoas, :pis, :string
    add_column :pessoas, :ctps, :string
    add_column :pessoas, :serie, :string
    add_column :pessoas, :rg, :string
    add_column :pessoas, :emissor, :string
    add_column :pessoas, :emissao, :string
    add_column :pessoas, :certificado_militar, :string
    add_column :pessoas, :emissor_militar, :string
    add_column :pessoas, :banco, :string
    add_column :pessoas, :agencia, :string
    add_column :pessoas, :conta_corrente, :string
    add_column :pessoas, :titulo_eleitoral, :string
    add_column :pessoas, :zona, :string
    add_column :pessoas, :secao, :string
    add_column :pessoas, :data_contratacao, :date
  end
end
