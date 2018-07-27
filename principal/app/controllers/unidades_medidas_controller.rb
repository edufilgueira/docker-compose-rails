
# frozen_string_literal: true

class UnidadesMedidasController < MaterialApplicationController
  before_action :set_unidades_medida, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.unidades_medida').pluralize, :unidades_medidas_path
  add_breadcrumb 'Detalhe', :unidades_medida_path, only: [:show]
  add_breadcrumb 'Novo', :new_unidades_medida_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_unidades_medida_path, only: %i[edit update]

  respond_to :html
  def index
    @unidades_medidas = UnidadesMedida.all
  end

  def show; end

  def new
    @unidades_medida = UnidadesMedida.new
  end

  def edit; end

  def create
    @unidades_medida = UnidadesMedida.new(unidades_medida_params)

    respond_to do |format|
      if @unidades_medida.save
        format.html { redirect_to unidades_medidas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @unidades_medida }
      else
        format.html { render :new }
        format.json { render json: @unidades_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @unidades_medida.update(unidades_medida_params)
      redirect_to unidades_medidas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @unidades_medida.destroy
        format.html { redirect_to unidades_medidas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @unidades_medida.errors.full_messages[0] if @unidades_medida.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unidades_medida
    @unidades_medida = UnidadesMedida.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def unidades_medida_params
    params.require(:unidades_medida).permit(:nome, :sigla)
    end
    end
