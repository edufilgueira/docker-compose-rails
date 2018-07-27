# encoding: utf-8
class CidadesController < ApplicationController
  before_action :set_cidade, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.cidade").pluralize, :cidades_path
  add_breadcrumb "Detalhe", :cidade_path, only: [:show]
  add_breadcrumb "Novo", :new_cidade_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_cidade_path, only: [:edit, :update]


  respond_to :html
  def index
    @cidades = Cidade.all
  end

  def show
  end

  def new
    @cidade = Cidade.new
  end

  def edit
  end

  def create
    @cidade = Cidade.new(cidade_params)

    respond_to do |format|
      if @cidade.save
        format.html { redirect_to cidades_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @cidade }
      else
        format.html { render :new }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @cidade.update(cidade_params)
      redirect_to cidades_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @cidade.destroy
        format.html { redirect_to cidades_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @cidade.errors.full_messages[0] if @cidade.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cidade
      @cidade = Cidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cidade_params
        params.require(:cidade).permit(:nome, :capital, :estado_id)
    end
end
