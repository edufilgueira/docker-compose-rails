
# frozen_string_literal: true

class FuncoesController < AdminApplicationController
  before_action :set_funcao, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.funcao').pluralize, :funcoes_path
  add_breadcrumb 'Detalhe', :funcao_path, only: [:show]
  add_breadcrumb 'Novo', :new_funcao_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_funcao_path, only: %i[edit update]

  respond_to :html
  def index
    @funcoes = Funcao.all
  end

  def show; end

  def new
    @funcao = Funcao.new
  end

  def edit; end

  def create
    @funcao = Funcao.new(funcao_params)

    respond_to do |format|
      if @funcao.save
        format.html { redirect_to funcoes_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @funcao }
      else
        format.html { render :new }
        format.json { render json: @funcao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @funcao.update(funcao_params)
      redirect_to funcoes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @funcao.destroy
        format.html { redirect_to funcoes_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @funcao.errors.full_messages[0] if @funcao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_funcao
    @funcao = Funcao.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def funcao_params
    params.require(:funcao).permit(:nome, :area_id)
  end
end
