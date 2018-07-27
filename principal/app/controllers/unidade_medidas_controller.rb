# encoding: utf-8
class UnidadeMedidasController < ApplicationController
  before_action :set_unidade_medida, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.unidade_medida").pluralize, :unidade_medidas_path
  add_breadcrumb "Detalhe", :unidade_medida_path, only: [:show]
  add_breadcrumb "Novo", :new_unidade_medida_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_unidade_medida_path, only: [:edit, :update]


  respond_to :html
  def index
    @unidade_medidas = UnidadeMedida.all
  end

  def show
  end

  def new
    @unidade_medida = UnidadeMedida.new
  end

  def edit
  end

  def create
    @unidade_medida = UnidadeMedida.new(unidade_medida_params)

    respond_to do |format|
      if @unidade_medida.save
        format.html { redirect_to unidade_medidas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @unidade_medida }
      else
        format.html { render :new }
        format.json { render json: @unidade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @unidade_medida.update(unidade_medida_params)
      redirect_to unidade_medidas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @unidade_medida.destroy
        format.html { redirect_to unidade_medidas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @unidade_medida.errors.full_messages[0] if @unidade_medida.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_medida
      @unidade_medida = UnidadeMedida.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def unidade_medida_params
        params.require(:unidade_medida).permit(:descricao, :ativo)
    end
end
