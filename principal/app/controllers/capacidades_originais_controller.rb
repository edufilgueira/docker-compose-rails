
# frozen_string_literal: true

class CapacidadesOriginaisController < VagaApplicationController
  before_action :set_capacidade_original, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.capacidade_original').pluralize, :capacidades_originais_path
  add_breadcrumb 'Detalhe', :capacidade_original_path, only: [:show]
  add_breadcrumb 'Novo', :new_capacidade_original_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_capacidade_original_path, only: %i[edit update]

  respond_to :html
  def index
    @capacidades_originais = CapacidadeOriginal.all
  end

  def show; end

  def new
    @capacidade_original = CapacidadeOriginal.new
  end

  def edit; end

  def create
    @capacidade_original = CapacidadeOriginal.new(capacidade_original_params)
    @capacidade_original.usuario = current_usuario
    respond_to do |format|
      if @capacidade_original.save
        format.html { redirect_to capacidades_originais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @capacidade_original }
      else
        format.html { render :new }
        format.json { render json: @capacidade_original.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @capacidade_original.update(capacidade_original_params)
      redirect_to capacidades_originais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @capacidade_original.destroy
        format.html { redirect_to capacidades_originais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @capacidade_original.errors.full_messages[0] if @capacidade_original.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_capacidade_original
    @capacidade_original = CapacidadeOriginal.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def capacidade_original_params
    params.require(:capacidade_original).permit(:unidade_socioeducativa_id, :capacidade, :data_referencia, :usuario_id)
  end
end
