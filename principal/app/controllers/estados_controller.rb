# encoding: utf-8
class EstadosController < ApplicationController
  before_action :set_estado, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.estado").pluralize, :estados_path
  add_breadcrumb "Detalhe", :estado_path, only: [:show]
  add_breadcrumb "Novo", :new_estado_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_estado_path, only: [:edit, :update]


  respond_to :html
  def index
    @estados = Estado.all
  end

  def show
  end

  def new
    @estado = Estado.new
  end

  def edit
  end

  def create
    @estado = Estado.new(estado_params)

    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @estado }
      else
        format.html { render :new }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @estado.update(estado_params)
      redirect_to estados_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @estado.destroy
        format.html { redirect_to estados_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @estado.errors.full_messages[0] if @estado.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estado_params
        params.require(:estado).permit(:nome, :acronym, :regiao_id)
    end
end
