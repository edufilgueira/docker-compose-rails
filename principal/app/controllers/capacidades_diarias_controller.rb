
# frozen_string_literal: true

class CapacidadesDiariasController < VagaApplicationController
  before_action :set_capacidade_diaria, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.capacidade_diaria').pluralize, :capacidades_diarias_path
  add_breadcrumb 'Detalhe', :capacidade_diaria_path, only: [:show]
  add_breadcrumb 'Novo', :new_capacidade_diaria_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_capacidade_diaria_path, only: %i[edit update]

  respond_to :html
  def index
    @capacidades_diarias = CapacidadeDiaria.all
  end

  def show; end

  def new
    @capacidade_diaria = CapacidadeDiaria.new
  end

  def edit; end

  def create
    @capacidade_diaria = CapacidadeDiaria.new(capacidade_diaria_params)
    @capacidade_diaria.usuario = current_usuario
    respond_to do |format|
      if @capacidade_diaria.save
        format.html { redirect_to capacidades_diarias_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @capacidade_diaria }
      else
        format.html { render :new }
        format.json { render json: @capacidade_diaria.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @capacidade_diaria.update(capacidade_diaria_params)
      redirect_to capacidades_diarias_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @capacidade_diaria.destroy
        format.html { redirect_to capacidades_diarias_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @capacidade_diaria.errors.full_messages[0] if @capacidade_diaria.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_capacidade_diaria
    @capacidade_diaria = CapacidadeDiaria.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def capacidade_diaria_params
    params.require(:capacidade_diaria).permit(:unidade_socioeducativa_id, :capacidade, :data_referencia, :usuario_id)
  end
end
