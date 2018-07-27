# -*- coding: utf-8 -*-
# frozen_string_literal: true
class MapaDeBordo < ApplicationRecord
  belongs_to :veiculo
  belongs_to :responsavel, class_name: 'Pessoa'
  belongs_to :motorista, class_name: 'Pessoa'

  enum tipo_vistoria: ['Diária']

  scope :aberto, -> { where(status: 'aberto') }
  scope :finalizado, -> { where(status: 'finalizado') }
end

