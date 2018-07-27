# frozen_string_literal: true

module Recursoshumanos
  # a classe Contrato define todas as estruturas referentes ao processo de criacao de vagas como o TipoLegal que foi utilizado , o TipoVinculo e informacoes referentes ao diario oficial do estado , assim como serve de agrupador para os Cargos
  class Contrato < ApplicationRecord
    # e' obrigatoria a presenca do numero do diario oficial do estado, que e' a publicacao que formaliza a criacao das vagas.
    validates_presence_of :doe_ce

    #pertence a um tipo legal , que define qual o formato do documento que formaliza a vaga , se e' um contrato , um decreto etc...
    belongs_to :recursoshumanos_tipo_legal, class_name: 'Recursoshumanos::TipoLegal', required: false

    # #pertence a um tipo vinculo, que define qual a origem da contratação, se é um contrato terceirizado, comissionado e etc...
    belongs_to :recursoshumanos_tipo_vinculo, class_name: 'Recursoshumanos::TipoVinculo', required: false

    #agrupa os cargos que possuem essas documentacoes em comum
    has_many :recursoshumanos_cargos, class_name: 'Recursoshumanos::Cargo', inverse_of: :contrato

    # permite receber atributos aninhados uma vez que a superintendencia requer que as vagas sejam cadastradas juntamente com os dados do doe.
    accepts_nested_attributes_for :recursoshumanos_cargos, allow_destroy: true

    # define a apresentacao comum para o Contrato
    def to_s
      recursoshumanos_tipo_legal.to_s + ' ' + doe_ce.to_s
    end
  end
end
