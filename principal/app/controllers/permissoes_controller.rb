
# frozen_string_literal: true

class PermissoesController < AdminApplicationController
  before_action :set_permissao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.permissao').pluralize, :permissoes_path
  add_breadcrumb 'Detalhe', :permissao_path, only: [:show]
  add_breadcrumb 'Novo', :new_permissao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_permissao_path, only: %i[edit update]

  respond_to :html
  def index
    @permissoes = Permissao.all
  end

  def show; end

  def new
    @permissao = Permissao.new
    @rotas = Permissao.generate_routes
  end

  def edit
    @rotas = Permissao.generate_routes
  end

  def create
    @permissao = Permissao.new(permissao_params)
    @permissao.recursos = params[:recursos]

    respond_to do |format|
      if @permissao.save
        format.html { redirect_to permissoes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @permissao }
      else
        @rotas = Permissao.generate_routes
        format.html { render :new }
        format.json { render json: @permissao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @permissao.recursos = params[:recursos]
    if @permissao.update(permissao_params)
      redirect_to permissoes_url, notice: t('messages.atualizado_sucesso')
    else
      @rotas = Permissao.generate_routes
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @permissao.destroy
        format.html { redirect_to permissoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @permissao.errors.full_messages[0] if @permissao.errors.present?
        format.html { redirect_back(fallback_location: permissoes_url) }
      end
    end
  end

  def duplicate
    p = Permissao.find_by(id: params[:permissao_id])
    perm = p.dup
    perm.perfil = "Cópia - #{perm.perfil}"
    if perm.save
      flash[:notice] = 'Cópia de permissão criada com sucesso'
    else
      flash[:error] = 'Erro ao criar cópia de permissão'
    end
    redirect_to permissoes_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_permissao
    @permissao = Permissao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def permissao_params
    params.require(:permissao).permit(:perfil, :recursos)
    end
    end
