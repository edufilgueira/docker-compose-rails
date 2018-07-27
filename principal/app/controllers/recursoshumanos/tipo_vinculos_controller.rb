
# frozen_string_literal: true

class Recursoshumanos::TipoVinculosController < AdminApplicationController
  before_action :set_recursoshumanos_tipo_vinculo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.recursoshumanos_tipo_vinculo').pluralize, :recursoshumanos_tipo_vinculos_path
  add_breadcrumb 'Detalhe', :recursoshumanos_tipo_vinculo_path, only: [:show]
  add_breadcrumb 'Novo', :new_recursoshumanos_tipo_vinculo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_recursoshumanos_tipo_vinculo_path, only: %i[edit update]

  respond_to :html
  def index
    @recursoshumanos_tipo_vinculos = Recursoshumanos::TipoVinculo.all
  end

  def show; end

  def new
    @recursoshumanos_tipo_vinculo = Recursoshumanos::TipoVinculo.new
  end

  def edit; end

  def create
    @recursoshumanos_tipo_vinculo = Recursoshumanos::TipoVinculo.new(recursoshumanos_tipo_vinculo_params)

    respond_to do |format|
      if @recursoshumanos_tipo_vinculo.save
        format.html { redirect_to recursoshumanos_tipo_vinculos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @recursoshumanos_tipo_vinculo }
      else
        format.html { render :new }
        format.json { render json: @recursoshumanos_tipo_vinculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recursoshumanos_tipo_vinculo.update(recursoshumanos_tipo_vinculo_params)
      redirect_to recursoshumanos_tipo_vinculos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @recursoshumanos_tipo_vinculo.destroy
        format.html { redirect_to recursoshumanos_tipo_vinculos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @recursoshumanos_tipo_vinculo.errors.full_messages[0] if @recursoshumanos_tipo_vinculo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recursoshumanos_tipo_vinculo
    @recursoshumanos_tipo_vinculo = Recursoshumanos::TipoVinculo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recursoshumanos_tipo_vinculo_params
    params.require(:recursoshumanos_tipo_vinculo).permit(:nome)
  end
end
