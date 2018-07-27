
# frozen_string_literal: true

class VeiculosController < TransporteApplicationController
  before_action :set_veiculo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.veiculo').pluralize, :veiculos_path
  add_breadcrumb 'Detalhe', :veiculo_path, only: [:show]
  add_breadcrumb 'Novo', :new_veiculo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_veiculo_path, only: %i[edit update]

  respond_to :html
  def index
    @veiculos = {
      ativos: Veiculo.ativos,
      manutencao: Veiculo.em_manutencao
    }

    valid_status_from_params = ['ativos', 'manutencao'] & [params[:status]]
    status = valid_status_from_params.first&.to_sym || :ativos
    @veiculos_a_mostrar = @veiculos[status]
  end

  def show
    Veiculo.find(params[:id]).update_attributes(status: 'ativos')
  end

  def new
    @veiculo = Veiculo.new
  end

  def ativar
    Veiculo.find(params[:id]).update_attributes(status: 'ativos')

    flash[:notice] = 'Em serviço!'
    redirect_to action: :index
  end

  def consertar
    Veiculo.find(params[:id]).update_attributes(status: 'manutencao')

    flash[:notice] = 'Em manuteção!'
    redirect_to action: :index
  end

  def edit; end

  def create
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to veiculos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @veiculo }
      else
        format.html { render :new }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @veiculo.update(veiculo_params)
      redirect_to veiculos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @veiculo.destroy
        format.html { redirect_to veiculos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @veiculo.errors.full_messages[0] if @veiculo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def veiculo_params
    params.require(:veiculo).permit(:placa, :km, :modelos_marca_id, :ano_fab, :ano_mod, :renavam, :chassi, :cor, :lotacao, :status)
  end
end
