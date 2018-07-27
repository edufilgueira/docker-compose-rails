# encoding: utf-8
class Socioeduk::RacaCoresController < ApplicationController
  before_action :set_socioeduk_raca_cor, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_raca_cor").pluralize, :socioeduk_raca_cores_path
  add_breadcrumb "Detalhe", :socioeduk_raca_cor_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_raca_cor_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_raca_cor_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_raca_cores = Socioeduk::RacaCor.all
  end

  def show
  end

  def new
    @socioeduk_raca_cor = Socioeduk::RacaCor.new
  end

  def edit
  end

  def create
    @socioeduk_raca_cor = Socioeduk::RacaCor.new(socioeduk_raca_cor_params)

    respond_to do |format|
      if @socioeduk_raca_cor.save
        format.html { redirect_to socioeduk_raca_cores_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_raca_cor }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_raca_cor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_raca_cor.update(socioeduk_raca_cor_params)
      redirect_to socioeduk_raca_cores_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_raca_cor.destroy
        format.html { redirect_to socioeduk_raca_cores_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_raca_cor.errors.full_messages[0] if @socioeduk_raca_cor.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_raca_cor
      @socioeduk_raca_cor = Socioeduk::RacaCor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_raca_cor_params
        params.require(:socioeduk_raca_cor).permit(:descricao)
    end
end
