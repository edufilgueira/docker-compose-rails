# frozen_string_literal: true

class Usuario < ApplicationRecord
  audited
  acts_as_paranoid
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :nome, presence: true
  validates :email, uniqueness: true
  before_validation :set_password_default, on: :create
  belongs_to :permissao, required: false
  has_one :pessoa, required: false
  has_many :funcoes
  has_many :funcoes, through: :pessoa

  def pessoa_id=(id)
    self.pessoa = Pessoa.find(id)
  end

  def pessoa_id
    pessoa&.id
  end

  def set_password_default
    return true unless password.blank? && password_confirmation.blank?
    self.password = Constants::PASSWD_DEFAULT
    self.password_confirmation = Constants::PASSWD_DEFAULT
  end

  def admin?
    admin = self&.permissao&.perfil
    'Admin'.eql? admin
  end

  def to_s
    email
  end
end
