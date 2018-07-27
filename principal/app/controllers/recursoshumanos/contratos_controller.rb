
# frozen_string_literal: true

class Recursoshumanos::ContratosController < AdminApplicationController
  before_action :set_recursoshumanos_contrato, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.recursoshumanos_contrato').pluralize, :recursoshumanos_contratos_path
  add_breadcrumb 'Detalhe', :recursoshumanos_contrato_path, only: [:show]
  add_breadcrumb 'Novo', :new_recursoshumanos_contrato_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_recursoshumanos_contrato_path, only: %i[edit update]

  respond_to :html
  def index
    @recursoshumanos_contratos = Recursoshumanos::Contrato.all
  end

  def show;  end

  def new
    @recursoshumanos_contrato = Recursoshumanos::Contrato.new
    @recursoshumanos_contrato.recursoshumanos_cargos.build
  end

  def edit; 
    if @recursoshumanos_contrato.id != nil
      @checked = "checked"
    else
      @checked = ""
    end
  end

  def create
    @recursoshumanos_contrato = Recursoshumanos::Contrato.new(recursoshumanos_contrato_params)

    respond_to do |format|
      if @recursoshumanos_contrato.save
        format.html { redirect_to recursoshumanos_contratos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @recursoshumanos_contrato }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_contrato.update(recursoshumanos_contrato_params)
      redirect_to recursoshumanos_contratos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_contrato.destroy
        format.html { redirect_to recursoshumanos_contratos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @recursoshumanos_contrato.errors.full_messages[0] if @recursoshumanos_contrato.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recursoshumanos_contrato
    @recursoshumanos_contrato = Recursoshumanos::Contrato.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recursoshumanos_contrato_params
    params.require(:recursoshumanos_contrato).permit(:recursoshumanos_tipo_legal_id, :recursoshumanos_tipo_vinculo_id, :inicio, :numero, :ano, :doe_ce, :data_doe_ce, :pagina_doe_ce, :inicio_vigencia, :final_vigencia, recursoshumanos_cargos_attributes: %i[nome quantidade _destroy id])
  end
end
