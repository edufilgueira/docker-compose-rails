
# frozen_string_literal: true

class GrupoMateriaisController < MaterialApplicationController
  before_action :set_grupo_material, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.grupo_material').pluralize, :grupo_materiais_path
  add_breadcrumb 'Detalhe', :grupo_material_path, only: [:show]
  add_breadcrumb 'Novo', :new_grupo_material_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_grupo_material_path, only: %i[edit update]

  respond_to :html
  def index
    @grupo_materiais = GrupoMaterial.all
  end

  def show; end

  def new
    @grupo_material = GrupoMaterial.new
  end

  def edit; end

  def create
    @grupo_material = GrupoMaterial.new(grupo_material_params)

    respond_to do |format|
      if @grupo_material.save
        format.html { redirect_to grupo_materiais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @grupo_material }
      else
        format.html { render :new }
        format.json { render json: @grupo_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @grupo_material.update(grupo_material_params)
      redirect_to grupo_materiais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @grupo_material.destroy
        format.html { redirect_to grupo_materiais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @grupo_material.errors.full_messages[0] if @grupo_material.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grupo_material
    @grupo_material = GrupoMaterial.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def grupo_material_params
    params.require(:grupo_material).permit(:codigo, :nome)
    end
    end
