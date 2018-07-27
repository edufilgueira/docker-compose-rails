# frozen_string_literal: true

class Admin::UsuariosController < AdminApplicationController
  before_action :set_usuario, only: %i[show edit update destroy function apply_functions]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.order(:created_at)
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show; end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @pessoas_disponiveis = Pessoa.where(usuario_id: nil)
  end

  # GET /usuarios/1/edit
  def edit
    @pessoas_disponiveis = Pessoa.where(usuario_id: nil)
    @pessoas_disponiveis += [@usuario.pessoa] unless @usuario.pessoa.nil?
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        @pessoa = Pessoa.find(usuario_params[:pessoa_id]).update_attributes!(usuario_id: @usuario.id)
        format.html { redirect_to admin_usuario_path(@usuario), notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to admin_usuario_path(@usuario), notice: I18n.t('messages.atualizado_sucesso') }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to admin_usuarios_url, notice: I18n.t('messages.delecao_sucesso') }
      format.json { head :no_content }
    end
  end

  def redefinir_senha
    @usuario = Usuario.find(params[:usuario_id])
    @usuario.reset_password(Constants::PASSWD_DEFAULT, Constants::PASSWD_DEFAULT)
    redirect_to admin_usuarios_url, notice: 'Senha redefinida com sucesso.'
  end

  def buscar_usuario_cpf
    cpf = params[:cpf]
    @pessoa = Pessoa.find_by_cpf(cpf)
    render json: @pessoa
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    id = params[:id] || params[:usuario_id]
    @usuario = Usuario.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation, :admin, :current_password, :functions_id, :permissao_id, :pessoa_id)
    # params.require(:usuario).permit(:nome, :email, :password, :password_confirmation, :admin, :current_password, :area_id, :functions_id, :permissao_id, :cargo, :pessoa_id)
  end
end
