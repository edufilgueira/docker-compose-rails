
# frozen_string_literal: true

class LocalArmazenamentosController < MaterialApplicationController
  before_action :set_local_armazenamento, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.local_armazenamento').pluralize, :local_armazenamentos_path
  add_breadcrumb 'Detalhe', :local_armazenamento_path, only: [:show]
  add_breadcrumb 'Novo', :new_local_armazenamento_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_local_armazenamento_path, only: %i[edit update]

  respond_to :html
  def index
    @local_armazenamentos = LocalArmazenamento.all
  end

  def show; end

  def new
    @local_armazenamento = LocalArmazenamento.new
  end

  def edit; end

  def create
    @local_armazenamento = LocalArmazenamento.new(local_armazenamento_params)

    respond_to do |format|
      if @local_armazenamento.save
        format.html { redirect_to local_armazenamentos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @local_armazenamento }
      else
        format.html { render :new }
        format.json { render json: @local_armazenamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @local_armazenamento.update(local_armazenamento_params)
      redirect_to local_armazenamentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @local_armazenamento.destroy
        format.html { redirect_to local_armazenamentos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @local_armazenamento.errors.full_messages[0] if @local_armazenamento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_local_armazenamento
    @local_armazenamento = LocalArmazenamento.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def local_armazenamento_params
    params.require(:local_armazenamento).permit(:descricao_local, :unidade_socioeducativa_id)
  end
end
