
# frozen_string_literal: true

class Socioeduk::Jovem < ApplicationRecord
  acts_as_paranoid
  belongs_to :opcao_sexual, required: false
  belongs_to :situacao_adolescente, required: false
  belongs_to :uf_naturalidade, class_name: "Estado", foreign_key: "uf_naturalidade_id"
  has_many :marca_corporais
  has_many :deficiencias
  has_many :enderecos
  has_many :contatos
  has_many :documentos
  has_many :admissoes
  has_many :atendimento_iniciais
  has_many :jovem_caracteristicas
  has_many :endereco_jovens
  validates_presence_of :nome
  enum gender: %i[male female others]
  has_attached_file :foto, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/assets/missing.png'
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
  before_save :translate_columns

  def translate_columns
    self.nome = I18n.transliterate(nome)
  end

  def cumprindo_medida?
    admissoes.where(tipo_desligamento_id: nil).present?
  end

  def ultima_admissao
    admissoes.last
  end

  # @return [Array<Array>]
  def self.gender_attributes_for_select
    genderes.map do |gender, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.genders.#{gender}"), gender]
    end
  end

  def tipos_estado_civil
    ['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)']
  end
end
