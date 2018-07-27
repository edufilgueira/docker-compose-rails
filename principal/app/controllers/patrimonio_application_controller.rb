# frozen_string_literal: true

# enconding: utf-8
class PatrimonioApplicationController < ApplicationController
  add_breadcrumb 'Patrimônio', :patrimonios_path

  protected

  def load_defaults
    super
    @selected_system = 'Patrimônio'
    @navigation_partial = 'navigation_patrimonios'
  end
end
