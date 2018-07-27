# frozen_string_literal: true

class Socioeduk::InfracaoPreliminar < ApplicationRecord
  belongs_to :atendimento_inicial
  belongs_to :tipo_infracao
end
