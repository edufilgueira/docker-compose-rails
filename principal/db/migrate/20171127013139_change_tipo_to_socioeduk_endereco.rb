# frozen_string_literal: true

class ChangeTipoToSocioedukEndereco < ActiveRecord::Migration[5.1]
  def change
    rename_column :socioeduk_enderecos, :tipo, :tipo_contato_id
  end
end
