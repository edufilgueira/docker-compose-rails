
# frozen_string_literal: true

class MateriaisController < MaterialApplicationController
  before_action :set_material, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.material').pluralize, :materiais_path
  add_breadcrumb 'Detalhe', :material_path, only: [:show]
  add_breadcrumb 'Novo', :new_material_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_material_path, only: %i[edit update]

  respond_to :html
  def index
    @materiais = Material.all
  end

  def show; end

  def new
    @material = Material.new
  end

  def edit; end

  def create
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to materiais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @material.update(material_params)
      redirect_to materiais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @material.destroy
        format.html { redirect_to materiais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @material.errors.full_messages[0] if @material.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def material_params
    params.require(:material).permit(:nome, :classe_material_id, :quantidade, :unidades_medida_id, :descricao, :local_armazenamento_id)
  end
end
