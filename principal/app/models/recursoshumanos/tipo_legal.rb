# -*- coding: utf-8 -*-

# frozen_string_literal: true

module Recursoshumanos
  # Define a estrutura de TipoLegal que sera utilizada pelo Contrato , o tipo legal
  # é o instrumento legal que foi utilizado para formalizar uma vaga ( Cargo ) ,por exemplo
  # o tipo legal pode ser um decreto , um contrato , um termo de colaboração.
  class TipoLegal < ApplicationRecord
    # Nome é obrigatório
    validates_presence_of :nome

    # todo tipo legal pertence a um tipo de vinculo que define o formato do contrato, há uma demanda aberta pela superintendencia para alterar isso
    belongs_to :recursoshumanos_tipo_vinculo, class_name: 'Recursoshumanos::TipoVinculo'

    # define a apresentacao para apresentacao do tipo legal.
    def to_s
      recursoshumanos_tipo_vinculo.to_s + ' - ' + nome
    end
  end
end
