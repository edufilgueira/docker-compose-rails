
# frozen_string_literal: true

class ServicosController < AdminApplicationController
  before_action :set_servico, only: %i[show edit update destroy]
  add_breadcrumb 'Serviços', :servicos_path
  add_breadcrumb 'Detalhe', :servico_path, only: [:show]
  add_breadcrumb 'Novo', :new_servico_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_servico_path, only: %i[edit update]

  respond_to :html
  def index
    @servicos = Servico.all
  end

  def show; end

  def new
    @servico = Servico.new
  end

  def edit; end

  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to servicos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @servico.update(servico_params)
      redirect_to servicos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @servico.destroy
        format.html { redirect_to servicos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @servico.errors.full_messages[0] if @servico.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_servico
    @servico = Servico.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def servico_params
    params.require(:servico).permit(:eixo_id, :nome)
    end
    end
