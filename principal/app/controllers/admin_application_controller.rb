# frozen_string_literal: true

class AdminApplicationController < ApplicationController
  add_breadcrumb 'RH', :recursoshumanos_tipo_vinculos_path

  protected

  def load_defaults
    super
    @selected_system = 'Admin'
    @navigation_partial = 'navigation_admin'
  end
end
