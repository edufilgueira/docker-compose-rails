
# frozen_string_literal: true

class ModelosMarcasController < TransporteApplicationController
  before_action :set_modelos_marca, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.modelos_marca').pluralize, :modelos_marcas_path
  add_breadcrumb 'Detalhe', :modelos_marca_path, only: [:show]
  add_breadcrumb 'Novo', :new_modelos_marca_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_modelos_marca_path, only: %i[edit update]

  respond_to :html
  def index
    @modelos_marcas = ModelosMarca.all
  end

  def show; end

  def new
    @modelos_marca = ModelosMarca.new
  end

  def edit; end

  def create
    @modelos_marca = ModelosMarca.new(modelos_marca_params)

    respond_to do |format|
      if @modelos_marca.save
        format.html { redirect_to modelos_marcas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @modelos_marca }
      else
        format.html { render :new }
        format.json { render json: @modelos_marca.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @modelos_marca.update(modelos_marca_params)
      redirect_to modelos_marcas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @modelos_marca.destroy
        format.html { redirect_to modelos_marcas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @modelos_marca.errors.full_messages[0] if @modelos_marca.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_modelos_marca
    @modelos_marca = ModelosMarca.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def modelos_marca_params
    params.require(:modelos_marca).permit(:modelo, :marca_veiculo_id)
  end
end
