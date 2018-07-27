# -*- coding: utf-8 -*-

# frozen_string_literal: true

module Recursoshumanos
  # Modelo nao persistido que e' utilizado para definir as estruturas de dados para apresentacao dos dados relacionados ao setor de recursos humanos, facilitando o entendimento e emissao de relatorios
  class Dashboard
    # Adicao de modelos para traducoes
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::Conversion
    include ActiveModel::Validations

    # Retornar informacoes sobre os cargos atuais, exemplo:
    #    { quantidade: 200, ocupados: 50}
    # representa: há 200 cargos e 50% deles estão ocupados.
    def cargos
      { quantidade: quantidade_cargos, ocupados: cargos_ocupados * 100 }
    end

    # Retornar informacoes sobre os colaboradores atuais, exemplo:
    #    { quantidade: 200, ocupados: 100}
    # representa: há 200 colaboradores ativos, o numero de ocupados sempre retorna 100 por motivos de legado é interessante analisar se isso já pode ser retirado sem impactar a view
    def colaboradores
      { quantidade: colaboradores_ativos, ocupados: 100 }
      # Não faz muito sentido o numero de ocupação verificar com o alcy
    end

    # Retornar informacoes sobre as admissões que ocorreram esse mês, exemplo:
    #    { quantidade: 30, qtd_sobre_cargos: 50}
    # representa: há 30 admissões e isso representa 50% dos cargos (ou seja o total de cargos é 60).
    def entradas
      { quantidade: quantidade_entradas, qtd_sobre_cargos: entrada_qtd_sobre_cargos * 100 }
    end


    # Retornar informacoes sobre as demissões que ocorreram esse mês, exemplo:
    #    { quantidade: 30, qtd_sobre_cargos: 50}
    # representa: há 30 demissões e isso representa 50% dos cargos (ou seja o total de cargos é 60).
    def saidas
      { quantidade: quantidade_saidas, qtd_sobre_cargos: saida_qtd_sobre_cargos * 100 }
    end

    private

    def quantidade_cargos
      Recursoshumanos::Cargo.sum(&:quantidade)
    end

    def colaboradores_ativos
      Recursoshumanos::Vinculo.where('data_fim is NULL').count
    end

    def quantidade_entradas
      # Não esquecer o >= ou no caso do primeiro dia do mês se tem a contagem errada
      Recursoshumanos::Vinculo.where('data_inicio >= ?', Date.today.beginning_of_month).count
    end

    def quantidade_saidas
      Recursoshumanos::Vinculo.where('data_fim >= ?', Date.today.beginning_of_month).count
    end

    def cargos_ocupados
      colaboradores_ativos / quantidade_cargos.to_f
    rescue StandardError
      return 0
    end

    def entrada_qtd_sobre_cargos
      quantidade_entradas / quantidade_cargos.to_f
    rescue StandardError
      return 0
    end

    def saida_qtd_sobre_cargos
      quantidade_saidas / quantidade_cargos.to_f
    rescue StandardError
      return 0
    end
  end

end
