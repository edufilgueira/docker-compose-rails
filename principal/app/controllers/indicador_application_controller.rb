# frozen_string_literal: true

class IndicadorApplicationController < ApplicationController
  add_breadcrumb 'Indicadores', :indicadores_path

  protected

  def load_defaults
    super
    @selected_system = 'Indicadores'
    @navigation_partial = 'navigation_indicadores'
  end
end
