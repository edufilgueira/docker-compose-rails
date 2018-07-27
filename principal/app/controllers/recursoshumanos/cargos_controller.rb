
# frozen_string_literal: true

class Recursoshumanos::CargosController < AdminApplicationController
  before_action :set_recursoshumanos_cargo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.recursoshumanos_cargo').pluralize, :recursoshumanos_cargos_path
  add_breadcrumb 'Detalhe', :recursoshumanos_cargo_path, only: [:show]
  add_breadcrumb 'Novo', :new_recursoshumanos_cargo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_recursoshumanos_cargo_path, only: %i[edit update]

  respond_to :html
  def index
    @recursoshumanos_cargos = Recursoshumanos::Cargo.all
  end

  def show; end

  def new
    @recursoshumanos_cargo = Recursoshumanos::Cargo.new
  end

  def edit; end

  def create
    @recursoshumanos_cargo = Recursoshumanos::Cargo.new(recursoshumanos_cargo_params)

    respond_to do |format|
      if @recursoshumanos_cargo.save
        format.html { redirect_to recursoshumanos_cargos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @recursoshumanos_cargo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_cargo.update(recursoshumanos_cargo_params)
      redirect_to recursoshumanos_cargos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_cargo.destroy
        format.html { redirect_to recursoshumanos_cargos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @recursoshumanos_cargo.errors.full_messages[0] if @recursoshumanos_cargo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recursoshumanos_cargo
    @recursoshumanos_cargo = Recursoshumanos::Cargo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recursoshumanos_cargo_params
    params.require(:recursoshumanos_cargo).permit(:nome, :quantidade, :contrato_id, :simbolo)
  end
end
