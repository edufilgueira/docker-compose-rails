# frozen_string_literal: true

class HomeController < ApplicationController
  add_breadcrumb 'Sistemas', :sistemas_path, only: :sistemas
  def sistemas
    render layout: 'clean'
  end
 
  def sistemas_socioeduk
    render layout: 'clean'
  end
end
