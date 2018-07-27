# frozen_string_literal: true

class CreateSocioedukJovens < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_jovens do |t|
      t.string :nome
      t.string :apelido
      t.boolean :falecido
      t.date :data_nascimento
      t.integer :sexo
      t.references :opcao_sexual, foreign_key: { to_table: :socioeduk_opcao_sexuais }
      t.string :nome_mae
      t.string :nome_pai
      t.numeric :peso
      t.numeric :altura
      t.boolean :dependente_quimico
      t.string :nacionalidade
      t.string :naturalidade
      t.string :etnia
      t.string :estado_civil_id
      t.boolean :orfao
      t.string :responsavel
      t.string :mora_com
      t.integer :numero_filhos
      t.string :responsavel_filhos
      t.string :tempo_gestacao
      t.boolean :amamentando
      t.attachment :foto

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
