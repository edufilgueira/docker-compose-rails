# frozen_string_literal: true

class CreateSocioedukAtendimentoIniciais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_atendimento_iniciais do |t|
      t.references :jovem, foreign_key: { to_table: :socioeduk_jovens }
      t.references :unidade_socioeducativa, index: { name: 'atend_inicial_unid_socio' }, foreign_key: true
      t.datetime :entrada_em
      t.boolean :reincidente
      t.boolean :cumpre_medida
      t.string :qual_medida
      t.string :cidade_infracao
      t.string :bairro_infracao
      t.boolean :busca_apreensao
      t.integer :cidade_origem_processo
      t.integer :cidade_execucao_processo
      t.string :numero_oficio_bo
      t.string :comarca_origem
      t.string :procedencia
      t.string :numero_processo
      t.boolean :guia_corpo_delito
      t.boolean :alcoolizado
      t.boolean :drogado
      t.boolean :ematomas
      t.string :agressor
      t.text :observacoes
      t.string :nome_condutor
      t.string :funcao_condutor
      t.string :rg_condutor
      t.boolean :encaminhado
      t.datetime :encaminhado_em
      t.references :tipo_desligamento, foreign_key: { to_table: :socioeduk_tipo_desligamentos }
      t.datetime :desligado_em
      t.datetime :deleted_at

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
