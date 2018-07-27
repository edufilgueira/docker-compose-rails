
# frozen_string_literal: true

class GestoresAreasController < AdminApplicationController
  before_action :set_gestor_area, only: %i[show edit update destroy]
  add_breadcrumb 'Gestores Areas', :gestores_areas_path
  add_breadcrumb 'Detalhe', :gestor_area_path, only: [:show]
  add_breadcrumb 'Novo', :new_gestor_area_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_gestor_area_path, only: %i[edit update]

  respond_to :html
  def index
    @gestores_areas = GestorArea.all
  end

  def show; end

  def new
    @gestor_area = GestorArea.new
  end

  def edit; end

  def create
    @gestor_area = GestorArea.new(gestor_area_params)

    respond_to do |format|
      if @gestor_area.save
        format.html { redirect_to gestores_areas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @gestor_area }
      else
        format.html { render :new }
        format.json { render json: @gestor_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @gestor_area.update(gestor_area_params)
      redirect_to gestores_areas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @gestor_area.destroy
        format.html { redirect_to gestores_areas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @gestor_area.errors.full_messages[0] if @gestor_area.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def areas
    @areas = GestorArea.get_by_area(params[:servico_realizado][:area_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gestor_area
    @gestor_area = GestorArea.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def gestor_area_params
    params.require(:gestor_area).permit(:area_id, :pessoa_id, :data_inicio, :data_termino, :ativo)
    end
    end
