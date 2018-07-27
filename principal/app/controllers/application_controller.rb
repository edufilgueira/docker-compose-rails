# frozen_string_literal: true

class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for Usuario
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_usuario!
  before_action :authorized_user?
  before_action :load_defaults
  skip_before_action :verify_authenticity_token
  add_breadcrumb 'Sistemas', :root_path

  protected

  def load_defaults
    @navigation_partial = 'navigation'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name provider uid])
  end

  def authorized_user?
    if has_permission?
      true
    else
      if request.xhr?
        flash[:error] = "#{t('system.message.not_permission')} #{params[:controller]}##{params[:action]}."
        # respond_to do |format|
        #   format.js { render :template => "layouts/_render_messages" }
        # end
      else
        flash[:error] = "#{t('system.message.not_permission')} #{params[:controller]}##{params[:action]}."
        return false if current_usuario.blank?
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def has_permission?
    path = "#{params[:controller].split('/').last}|#{params[:action]}"
    admin = Permissao.permissao_do_admin
    permissoes = current_usuario&.permissao&.recursos
    if permissoes.blank?
      false
    else
      permissoes.include?(path) || permissoes.include?(admin)
    end
  end

  private

  # modifica redirecionamento apos o logout do DEVISE.
  def after_sign_out_path_for(_resource_or_scope)
    '/'
  end
end
