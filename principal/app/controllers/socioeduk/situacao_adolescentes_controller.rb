# encoding: utf-8
class Socioeduk::SituacaoAdolescentesController < ApplicationController
  before_action :set_socioeduk_situacao_adolescente, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.socioeduk_situacao_adolescente").pluralize, :socioeduk_situacao_adolescentes_path
  add_breadcrumb "Detalhe", :socioeduk_situacao_adolescente_path, only: [:show]
  add_breadcrumb "Novo", :new_socioeduk_situacao_adolescente_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_socioeduk_situacao_adolescente_path, only: [:edit, :update]


  respond_to :html
  def index
    @socioeduk_situacao_adolescentes = Socioeduk::SituacaoAdolescente.all
  end

  def show
  end

  def new
    @socioeduk_situacao_adolescente = Socioeduk::SituacaoAdolescente.new
  end

  def edit
  end

  def create
    @socioeduk_situacao_adolescente = Socioeduk::SituacaoAdolescente.new(socioeduk_situacao_adolescente_params)

    respond_to do |format|
      if @socioeduk_situacao_adolescente.save
        format.html { redirect_to socioeduk_situacao_adolescentes_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @socioeduk_situacao_adolescente }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_situacao_adolescente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_situacao_adolescente.update(socioeduk_situacao_adolescente_params)
      redirect_to socioeduk_situacao_adolescentes_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_situacao_adolescente.destroy
        format.html { redirect_to socioeduk_situacao_adolescentes_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @socioeduk_situacao_adolescente.errors.full_messages[0] if @socioeduk_situacao_adolescente.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socioeduk_situacao_adolescente
      @socioeduk_situacao_adolescente = Socioeduk::SituacaoAdolescente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def socioeduk_situacao_adolescente_params
        params.require(:socioeduk_situacao_adolescente).permit(:descricao, :remocao_fila)
    end
end
