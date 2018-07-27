
# frozen_string_literal: true

class TipoPatrimoniosController < PatrimonioApplicationController
  before_action :set_tipo_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.tipo_patrimonio').pluralize, :tipo_patrimonios_path
  add_breadcrumb 'Detalhe', :tipo_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_tipo_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_tipo_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @tipo_patrimonios = TipoPatrimonio.all
  end

  def show; end

  def new
    @tipo_patrimonio = TipoPatrimonio.new
  end

  def edit; end

  def create
    @tipo_patrimonio = TipoPatrimonio.new(tipo_patrimonio_params)

    respond_to do |format|
      if @tipo_patrimonio.save
        format.html { redirect_to tipo_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @tipo_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @tipo_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @tipo_patrimonio.update(tipo_patrimonio_params)
      redirect_to tipo_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @tipo_patrimonio.destroy
        format.html { redirect_to tipo_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @tipo_patrimonio.errors.full_messages[0] if @tipo_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tipo_patrimonio
    @tipo_patrimonio = TipoPatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tipo_patrimonio_params
    params.require(:tipo_patrimonio).permit(:nome)
  end
end
