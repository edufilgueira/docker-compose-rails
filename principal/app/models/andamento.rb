# frozen_string_literal: true

class Andamento < ApplicationRecord
  belongs_to :usuario
  belongs_to :destinatario, class_name: 'Area'
  belongs_to :carga, polymorphic: true
end
