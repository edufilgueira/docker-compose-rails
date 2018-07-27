class AddJustificativaCancelamentoToSolicitacaoTransportes < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitacao_transportes, :justificativa_cancelamento, :text
  end
end
