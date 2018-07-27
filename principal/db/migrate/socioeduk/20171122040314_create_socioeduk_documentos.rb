# frozen_string_literal: true

class CreateSocioedukDocumentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_documentos do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.string :cpf
      t.string :rg_numero
      t.date :rg_data_emissao
      t.string :rg_orgao_emissor
      t.string :rg_uf_emissao
      t.string :certidao_nascimento
      t.string :certidao_numero
      t.string :certidao_pagina
      t.string :certidao_livro
      t.date :certidao_data_emissao
      t.string :certidao_uf_emissao
      t.string :cpts_numero
      t.string :ctps_serie
      t.string :ctps_data_emissao
      t.string :ctps_uf_emissao
      t.string :titulo_numero
      t.string :titulo_serie
      t.string :titulo_secao
      t.string :pis_numero
      t.string :reservista_numero
      t.datetime :deleted_at

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
