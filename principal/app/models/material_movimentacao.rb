
# frozen_string_literal: true

class MaterialMovimentacao < ApplicationRecord
  belongs_to :material
  belongs_to :unidade_socioeducativa

  def tipos_movimentacoes_opcoes
    %W[Entrada Sa\u00EDda]
  end
end
