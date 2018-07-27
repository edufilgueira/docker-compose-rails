# frozen_string_literal: true

class AuthController < ApplicationController
  skip_before_action :authenticate_usuario!
  def is_signed_in?
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    if user_signed_in?
      render json: { 'signed_in' => true, 'user' => current_usuario }.to_json
    else
      render json: { 'signed_in' => false }.to_json
    end
  end
end
