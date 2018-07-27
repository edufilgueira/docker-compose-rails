# encoding: utf-8
class Socioeduk::CorOlhosController < ApplicationController
  before_action :set_socioeduk_cor_olho, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_cor_olho").pluralize, :socioeduk_cor_olhos_path
  add_breadcrumb "Detalhe", :socioeduk_cor_olho_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_cor_olho_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_cor_olho_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_cor_olhos = Socioeduk::CorOlho.all
  end

  def show
  end

  def new
    @socioeduk_cor_olho = Socioeduk::CorOlho.new
  end

  def edit
  end

  def create
    @socioeduk_cor_olho = Socioeduk::CorOlho.new(socioeduk_cor_olho_params)

    respond_to do |format|
      if @socioeduk_cor_olho.save
        format.html { redirect_to socioeduk_cor_olhos_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_cor_olho }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_cor_olho.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_cor_olho.update(socioeduk_cor_olho_params)
      redirect_to socioeduk_cor_olhos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_cor_olho.destroy
        format.html { redirect_to socioeduk_cor_olhos_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_cor_olho.errors.full_messages[0] if @socioeduk_cor_olho.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_cor_olho
      @socioeduk_cor_olho = Socioeduk::CorOlho.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_cor_olho_params
        params.require(:socioeduk_cor_olho).permit(:descricao)
    end
end
