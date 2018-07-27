
# frozen_string_literal: true

class IndicadorAssuntosController < IndicadorApplicationController
  before_action :set_indicador_assunto, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.indicador_assunto').pluralize, :indicador_assuntos_path
  add_breadcrumb 'Detalhe', :indicador_assunto_path, only: [:show]
  add_breadcrumb 'Novo', :new_indicador_assunto_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_indicador_assunto_path, only: %i[edit update]

  respond_to :html
  def index
    @indicador_assuntos = IndicadorAssunto.all
  end

  def show; end

  def new
    @indicador_assunto = IndicadorAssunto.new
  end

  def edit; end

  def create
    @indicador_assunto = IndicadorAssunto.new(indicador_assunto_params)

    respond_to do |format|
      if @indicador_assunto.save
        format.html { redirect_to indicador_assuntos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @indicador_assunto }
      else
        format.html { render :new }
        format.json { render json: @indicador_assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @indicador_assunto.update(indicador_assunto_params)
      redirect_to indicador_assuntos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @indicador_assunto.destroy
        format.html { redirect_to indicador_assuntos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @indicador_assunto.errors.full_messages[0] if @indicador_assunto.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_indicador_assunto
    @indicador_assunto = IndicadorAssunto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def indicador_assunto_params
    params.require(:indicador_assunto).permit(:nome)
  end
end
