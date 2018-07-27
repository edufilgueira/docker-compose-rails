# frozen_string_literal: true

class Usuarios::RegistrationsController < Devise::RegistrationsController
  layout 'login', except: %i[edit update]
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    redirect_to :user_session, notice: 'Solicite o seu cadastramento via email: <a href="malito:cgti@seas.ce.gov.br" class="link-success">cgti@seas.ce.gov.br<a>'
  end

  # POST /resource
  def create
    redirect_to :user_session, notice: 'Solicite o seu cadastramento via email: cgti@seas.ce.gov.br'
  end

  # GET /resource/edit
  def edit
    @atributos_campos_nome_email = {}
    unless current_usuario.permissao.admin?
      @atributos_campos_nome_email['disabled'] = 'disable'
    end
    super
  end

  # PUT /resource
  def update
    @atributos_campos_nome_email = {}
    unless current_usuario.permissao.admin?
      @atributos_campos_nome_email['disabled'] = 'disable'
      params['usuario'].delete('nome')
      params['usuario'].delete('email')
    end
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nome admin])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
