# frozen_string_literal: true

class RecepcaoApplicationController < ApplicationController
  protected

    def load_defaults
      super
      @selected_system = 'Recepção'
      @navigation_partial = 'navigation_recepcao'
    end
end
