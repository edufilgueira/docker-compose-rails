# frozen_string_literal: true

class Socioeduk::AtendimentoInicialDocumento < ApplicationRecord
  belongs_to :atendimento_inicial
  belongs_to :documento_forma_entrada
end
