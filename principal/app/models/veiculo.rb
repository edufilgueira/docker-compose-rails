# Classe de veiculos para a aplicacao de transporte
class Veiculo < ApplicationRecord
  belongs_to :modelos_marca
  belongs_to :tipo_de_combustivel, required: false

  scope :ativos, -> { where(status: 'ativos') }
  scope :em_manutencao, -> { where(status: 'manutencao') }

  def to_s
    "#{modelos_marca.modelo} - #{placa}"
  end
end
