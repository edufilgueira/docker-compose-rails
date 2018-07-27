# frozen_string_literal: true

module Recursoshumanos
  # Essa classe define um Cargo (tambem chamado de vaga pela superintendencia) na estrutura da SEAS
  # Este cargo nao necessariamente esta ocupado
  # A ocupacao de um cargo e definida pelo Vinculo.
  class Cargo < ApplicationRecord

    validates :nome, :quantidade, presence: true
    # todo cargo pertence a um contrato que agrupa informacoes comuns a estes cargos como o tipo legal e o tipo de vinculo desses cargos assim como informacoes referentes ao diario oficial que os publicos
    belongs_to :contrato, class_name: 'Recursoshumanos::Contrato', foreign_key: 'contrato_id', inverse_of: :recursoshumanos_cargos

    # um cargo pode ter diversos vinculos , e' discutivel se isso sera mantido ao longo do tempo uma vez que para facilitar uma manutencao do historico (quem ocupou anteriormente uma mesma vaga) pode ser interessante separar os cargos e ao invez de ter um campo quantidade, criar um objeto para cada vaga, embora ainda assim teriamos diversos vinculos , devido ao historico da vaga.
    has_many :vinculos, class_name: 'Recursoshumanos::Vinculo', foreign_key: 'recursoshumanos_cargo_id', inverse_of: :recursoshumanos_cargo

    # o Tipo legal e' utilizado na listagem dos cargos e portanto para facilitar adicionamos essa delegacao.
    delegate :recursoshumanos_tipo_legal, to: :contrato

    # Retorna o nome do cargo em maiusculas
    def to_s
      nome&.upcase
    end

    def quantidade_cargo_contratado
      contratado
    end

    def quantidade_cargo_disponivel
      self.quantidade - quantidade_cargo_contratado
    end

    # Retorna o total de vagas disponiveis , a contagem sempre deve ser feita deduzindo as vagas ocupadas uma vez que um mesmo cargo pode ter multiplos vinculos passados ja encerrados.
    def self.total_de_vagas
      vagas_totais = sum(:quantidade)
      vagas_ocupadas = Recursoshumanos::Vinculo.where('data_fim is null').count
      vagas_totais - vagas_ocupadas
    end

    # Busca todos os cargos que possuem vagas diponiveis.
    def self.com_vagas_disponiveis
      Recursoshumanos::Cargo.joins('LEFT OUTER JOIN recursoshumanos_vinculos vinculos ON (recursoshumanos_cargos.id = vinculos.recursoshumanos_cargo_id and vinculos.data_fim is null) ').group(:recursoshumanos_cargo_id, :quantidade, :id).having('count(recursoshumanos_cargo_id) < quantidade').to_a
    end

    private

    def contratado
      if (@contratado == nil)
        @contratado = Vinculo.select(:id).where("recursoshumanos_cargo_id = ?", self.id).count
      else
        @contratado
      end
    end

  end
end
