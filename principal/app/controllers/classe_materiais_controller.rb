
# frozen_string_literal: true

class ClasseMateriaisController < MaterialApplicationController
  before_action :set_classe_material, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.classe_material').pluralize, :classe_materiais_path
  add_breadcrumb 'Detalhe', :classe_material_path, only: [:show]
  add_breadcrumb 'Novo', :new_classe_material_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_classe_material_path, only: %i[edit update]

  respond_to :html
  def index
    @classe_materiais = ClasseMaterial.all
  end

  def show; end

  def new
    @classe_material = ClasseMaterial.new
  end

  def edit; end

  def create
    @classe_material = ClasseMaterial.new(classe_material_params)

    respond_to do |format|
      if @classe_material.save
        format.html { redirect_to classe_materiais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @classe_material }
      else
        format.html { render :new }
        format.json { render json: @classe_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @classe_material.update(classe_material_params)
      redirect_to classe_materiais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @classe_material.destroy
        format.html { redirect_to classe_materiais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @classe_material.errors.full_messages[0] if @classe_material.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_classe_material
    @classe_material = ClasseMaterial.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def classe_material_params
    params.require(:classe_material).permit(:codigo, :nome, :grupo_material_id)
    end
    end
