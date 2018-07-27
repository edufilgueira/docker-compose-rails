# frozen_string_literal: true

class Permissao < ApplicationRecord
  audited
  validates_presence_of :perfil, :recursos
  validates_uniqueness_of :perfil
  has_many :usuarios, dependent: :restrict_with_error
  default_scope { order(:perfil) }

  def self.generate_routes
    rotas = {}
    actions = {}
    Rails.application.eager_load!
    ApplicationController.descendants.each do |con|
      # con.action_methods.each do |action|
      #   actions = actions.merge({action => false})
      # end
      rotas = rotas.merge(con.controller_name => con.action_methods.to_a)
      actions = {}
    end
    rotas.sort
  end

  def self.permissao_do_admin
    'administrator|system'
  end

  def admin?
    recursos.include?(Permissao.permissao_do_admin)
  end
end
