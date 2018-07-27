# frozen_string_literal: true

class VagaApplicationController < ApplicationController
  protected

    def load_defaults
      super
      @selected_system = 'Vagas'
      @navigation_partial = 'navigation_vagas'
    end
end
