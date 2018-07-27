# frozen_string_literal: true

class Patrimonio < ApplicationRecord
  acts_as_paranoid
  belongs_to :status_patrimonio
  belongs_to :deposito, required: false
  belongs_to :area, required: false
  belongs_to :item_patrimonio
  validates :tombo_atual, :origem_atual, presence: true
  validate :deposito_or_area

  def deposito_or_area
    if deposito_id.blank? and area_id.blank?
      errors.add(:base, "Informe a localização do bem.")
    end
  end
end
