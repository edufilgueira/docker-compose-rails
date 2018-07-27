# frozen_string_literal: true

# enconding: utf-8
class TransporteApplicationController < ApplicationController
  TransporteApplicationController
  add_breadcrumb 'Transporte', :marca_veiculos_path

  protected

  def load_defaults
    super
    @selected_system = ' Transporte'
    @navigation_partial = 'navigation_transportes'
  end
  end
