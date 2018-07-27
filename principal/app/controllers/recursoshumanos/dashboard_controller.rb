# frozen_string_literal: true

class Recursoshumanos::DashboardController < AdminApplicationController
  def index
    @dashboard = Recursoshumanos::Dashboard.new
  end
end
