class AddColumnsToSocioedukJovem < ActiveRecord::Migration[5.1]
  def change
    add_reference :socioeduk_jovens, :socioeduk_situacao_adolescente, foreign_key: true
    add_column :socioeduk_jovens, :uf_naturalidade_id, :integer 
    add_column :socioeduk_jovens, :cidade_naturalidade_id, :integer 
    add_column :socioeduk_jovens, :idade_estimada, :integer
    add_column :socioeduk_jovens, :outras_info_fisica, :string
    add_column :socioeduk_jovens, :reside_fora_pais, :boolean
    add_column :socioeduk_jovens, :cpf, :string
    add_column :socioeduk_jovens, :rg, :string
    add_column :socioeduk_jovens, :orgao_expedidor, :string
    add_column :socioeduk_jovens, :providenciando_documentos, :boolean
    add_reference :socioeduk_jovens, :socioeduk_tipo_cabelo, foreign_key: true
    add_reference :socioeduk_jovens, :socioeduk_cor_olhos, foreign_key: true
    add_reference :socioeduk_jovens, :socioeduk_raca_cor, foreign_key: true
  end
end
