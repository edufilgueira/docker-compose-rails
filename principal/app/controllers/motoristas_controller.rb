# encoding: utf-8
class MotoristasController < TransporteApplicationController
  before_action :set_motorista, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t("activerecord.models.motorista").pluralize, :motoristas_path
  add_breadcrumb "Detalhe", :motorista_path, only: [:show]
  add_breadcrumb "Novo", :new_motorista_path, only: [:new, :create]
  add_breadcrumb "Editar", :edit_motorista_path, only: [:edit, :update]


  respond_to :html
  def index
    @motorista_diposniveis = Motorista.where(status: nil)
    @motorista_ocupados = Motorista.where(status: 'ocupado')
    @motorista_ausentes = Motorista.where(status: 'ausente')
    @motoristas = Motorista.all

    @condutor = if params['status'] == 'ocupado'
      @motorista_ocupados
    elsif params['status'] == 'ausente'
      @motorista_ausentes
    else
      @motorista_diposniveis
  end

  end

  def show
  end

  def new
    @motorista = Motorista.new
    funcao_motorista = Funcao.find_by_nome('Motorista')
    @motoristas = funcao_motorista.pessoas
  end

  def edit
    funcao_motorista = Funcao.find_by_nome('Motorista')
    @motoristas = funcao_motorista.pessoas
  end

  def ocupar
    Motorista.find(params[:id]).update_attributes(status: 'ocupado')

    flash[:notice] = 'Motorista em serviço'
    redirect_to action: :index
  end

  def ausentar
    Motorista.find(params[:id]).update_attributes(status: 'ausente')

    flash[:notice] = 'Motorisrta está ausente'
    redirect_to action: :index
  end

  def disponibilizar
    Motorista.find(params[:id]).update_attributes(status: nil)

    flash[:notice] = 'Motorisrta está disponível'
    redirect_to action: :index
  end

  def create
    @motorista = Motorista.new(motorista_params)

    respond_to do |format|
      if @motorista.save
        format.html { redirect_to motoristas_url, notice: I18n.t("messages.cadastro_sucesso") }
        format.json { render :show, status: :created, location: @motorista }
      else
        format.html { render :new }
        format.json { render json: @motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @motorista.update(motorista_params)
      redirect_to motoristas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @motorista.destroy
        format.html { redirect_to motoristas_url, notice: I18n.t("messages.delecao_sucesso") }
      else
        flash[:error] = @motorista.errors.full_messages[0] if @motorista.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorista
      @motorista = Motorista.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def motorista_params
        params.require(:motorista).permit(:pessoa_id, :numero, :registro, :validade, :categoria, :obs)
    end
end
