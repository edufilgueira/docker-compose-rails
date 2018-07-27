
# frozen_string_literal: true

class StatusPatrimoniosController < PatrimonioApplicationController
  before_action :set_status_patrimonio, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.status_patrimonio').pluralize, :status_patrimonios_path
  add_breadcrumb 'Detalhe', :status_patrimonio_path, only: [:show]
  add_breadcrumb 'Novo', :new_status_patrimonio_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_status_patrimonio_path, only: %i[edit update]

  respond_to :html
  def index
    @status_patrimonios = StatusPatrimonio.all
  end

  def show; end

  def new
    @status_patrimonio = StatusPatrimonio.new
  end

  def edit; end

  def create
    @status_patrimonio = StatusPatrimonio.new(status_patrimonio_params)

    respond_to do |format|
      if @status_patrimonio.save
        format.html { redirect_to status_patrimonios_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @status_patrimonio }
      else
        format.html { render :new }
        format.json { render json: @status_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @status_patrimonio.update(status_patrimonio_params)
      redirect_to status_patrimonios_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @status_patrimonio.destroy
        format.html { redirect_to status_patrimonios_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @status_patrimonio.errors.full_messages[0] if @status_patrimonio.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status_patrimonio
    @status_patrimonio = StatusPatrimonio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def status_patrimonio_params
    params.require(:status_patrimonio).permit(:nome, :descricao)
  end
end
