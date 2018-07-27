
# frozen_string_literal: true

class Indicador < ApplicationRecord
  belongs_to :indicador_unidade_medida
  belongs_to :area
  belongs_to :indicador_assunto

  def to_s
    nome
  end

  def self.possiveis_sentidos
    ['Quanto MAIOR melhor', 'Quanto MENOR melhor', 'Quanto IGUAL melhor']
  end

  def self.periodicidades
    %W[Di\u00E1ria Semanal Quinzenal Mensal Trimestral Quadrimestral Semestral Anual]
  end

  def self.possiveis_periodicidade_coleta
    periodicidades
  end

  def self.possiveis_periodicidade_avaliacao
    periodicidades
  end

  def self.possiveis_abrangencias
    %W[Organiza\u00E7\u00E3o \u00C1rea Pessoa]
  end
end
