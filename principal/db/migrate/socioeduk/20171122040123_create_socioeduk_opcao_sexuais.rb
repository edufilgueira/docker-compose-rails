# frozen_string_literal: true

class CreateSocioedukOpcaoSexuais < ActiveRecord::Migration[5.1]
  def change
    create_table :socioeduk_opcao_sexuais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
