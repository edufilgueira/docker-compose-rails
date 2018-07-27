# frozen_string_literal: true

# enconding: utf-8
class MaterialApplicationController < ApplicationController
  add_breadcrumb 'Material', :materiais_path

  protected

  def load_defaults
    super
    @selected_system = 'Materiais'
    @navigation_partial = 'navigation_materiais'
  end
end
