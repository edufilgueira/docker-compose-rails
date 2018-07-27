# encoding: utf-8
class Socioeduk::TipoSinaisController < ApplicationController
  before_action :set_socioeduk_tipo_sinal, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_tipo_sinal").pluralize, :socioeduk_tipo_sinais_path
  add_breadcrumb "Detalhe", :socioeduk_tipo_sinal_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_tipo_sinal_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_tipo_sinal_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_tipo_sinais = Socioeduk::TipoSinal.all
  end

  def show
  end

  def new
    @socioeduk_tipo_sinal = Socioeduk::TipoSinal.new
  end

  def edit
  end

  def create
    @socioeduk_tipo_sinal = Socioeduk::TipoSinal.new(socioeduk_tipo_sinal_params)

    respond_to do |format|
      if @socioeduk_tipo_sinal.save
        format.html { redirect_to socioeduk_tipo_sinais_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_tipo_sinal }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_sinal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_sinal.update(socioeduk_tipo_sinal_params)
      redirect_to socioeduk_tipo_sinais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_sinal.destroy
        format.html { redirect_to socioeduk_tipo_sinais_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_tipo_sinal.errors.full_messages[0] if @socioeduk_tipo_sinal.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_tipo_sinal
      @socioeduk_tipo_sinal = Socioeduk::TipoSinal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_tipo_sinal_params
        params.require(:socioeduk_tipo_sinal).permit(:descricao)
    end
end
