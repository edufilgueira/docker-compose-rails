# frozen_string_literal: true

class ColetaIndicador < ApplicationRecord
  belongs_to :indicador
  validates :semestre, numericality: { only_integer: true, less_than_or_equal_to: 2 }, presence: false
  validates :quadrimestre, numericality: { only_integer: true, less_than_or_equal_to: 3 }, presence: false
  validates :trimestre, numericality: { only_integer: true, less_than_or_equal_to: 4 }, presence: false
  validates :quinzena, numericality: { only_integer: true, less_than_or_equal_to: 2 }, presence: false
  validates :semana, numericality: { only_integer: true, less_than_or_equal_to: 5 }, presence: false
  validates :mes, numericality: { only_integer: true, less_than_or_equal_to: 12 }, presence: false
  belongs_to :area, required: false
  validates_presence_of :indice

  def self.periodicidades
    Indicador.periodicidades
  end

  def date_field_to_show
    fields_to_show = []
    periodicidades = self.class.periodicidades

    fields_to_show.push('Anual')

    fields_to_show.push('Mensal') if periodicidades.index('Mensal') > periodicidades.index(periodo_coleta)

    fields_to_show.push(periodo_coleta)
    fields_to_show
  end
end
