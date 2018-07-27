# encoding: utf-8
class RegioesController < ApplicationController
  before_action :set_regiao, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.regiao").pluralize, :regioes_path
  add_breadcrumb "Detalhe", :regiao_path, only: [:show]
  add_breadcrumb "Novo", :new_regiao_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_regiao_path, only: [:edit, :update]


  respond_to :html
  def index
    @regioes = Regiao.all
  end

  def show
  end

  def new
    @regiao = Regiao.new
  end

  def edit
  end

  def create
    @regiao = Regiao.new(regiao_params)

    respond_to do |format|
      if @regiao.save
        format.html { redirect_to regioes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @regiao }
      else
        format.html { render :new }
        format.json { render json: @regiao.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @regiao.update(regiao_params)
      redirect_to regioes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @regiao.destroy
        format.html { redirect_to regioes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @regiao.errors.full_messages[0] if @regiao.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regiao
      @regiao = Regiao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def regiao_params
        params.require(:regiao).permit(:nome)
    end
end
