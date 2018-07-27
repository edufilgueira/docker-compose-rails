# frozen_string_literal: true

class Socioeduk::AtendimentoInicial < ApplicationRecord
  belongs_to :jovem
  belongs_to :unidade_socioeducativa
  belongs_to :tipo_desligamento
end
