# frozen_string_literal: true

class CreateSocioedukAtendimentoInicialDocumentos < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_atendimento_inicial_documentos do |t|
      t.string :descricao
      t.references :atendimento_inicial, index: { name: 'index_socioeduk_atendimento_ini_doc_on_atend_ini_id' }, foreign_key: { to_table: :socioeduk_atendimento_iniciais }
      t.references :documento_forma_entrada, index: { name: 'index_socioeduk_atend_ini_docu_on_doc_form_ent_id' }, foreign_key: { to_table: :socioeduk_documento_forma_entradas }
      t.attachment :documento

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
