
# frozen_string_literal: true

class AreasController < AdminApplicationController
  before_action :set_area, only: %i[show edit update destroy]
  add_breadcrumb 'Areas', :areas_path
  add_breadcrumb 'Detalhe', :area_path, only: [:show]
  add_breadcrumb 'Novo', :new_area_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_area_path, only: %i[edit update]

  respond_to :html
  def index
    @areas = Area.all
  end

  def show; end

  def new
    @area = Area.new
  end

  def edit; end

  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @area.update(area_params)
      redirect_to areas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @area.destroy
        format.html { redirect_to areas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @area.errors.full_messages[0] if @area.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_area
    @area = Area.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def area_params
    params.require(:area).permit(:nome, :subarea_id, :sigla, :unidade_socioeducativa_id)
    end
    end
