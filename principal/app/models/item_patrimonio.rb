# frozen_string_literal: true

class ItemPatrimonio < ApplicationRecord
  acts_as_paranoid
  belongs_to :classe_patrimonio
  belongs_to :tipo_patrimonio
  has_many :patrimonios, dependent: :destroy
  validates :codigo, :nome, :descricao, presence: true

  scope :buscar_itens_classe, ->(classe_patrimonio_id) { where(classe_patrimonio_id: classe_patrimonio_id) if classe_patrimonio_id.present? }

  def to_s
    nome
  end
end
