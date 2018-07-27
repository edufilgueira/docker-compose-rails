
# frozen_string_literal: true

class MarcaVeiculosController < TransporteApplicationController
  before_action :set_marca_veiculo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.marca_veiculo').pluralize, :marca_veiculos_path
  add_breadcrumb 'Detalhe', :marca_veiculo_path, only: [:show]
  add_breadcrumb 'Novo', :new_marca_veiculo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_marca_veiculo_path, only: %i[edit update]

  respond_to :html
  def index
    @marca_veiculos = MarcaVeiculo.all
  end

  def show; end

  def new
    @marca_veiculo = MarcaVeiculo.new
  end

  def edit; end

  def create
    @marca_veiculo = MarcaVeiculo.new(marca_veiculo_params)

    respond_to do |format|
      if @marca_veiculo.save
        format.html { redirect_to marca_veiculos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @marca_veiculo }
      else
        format.html { render :new }
        format.json { render json: @marca_veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @marca_veiculo.update(marca_veiculo_params)
      redirect_to marca_veiculos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @marca_veiculo.destroy
        format.html { redirect_to marca_veiculos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @marca_veiculo.errors.full_messages[0] if @marca_veiculo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_marca_veiculo
    @marca_veiculo = MarcaVeiculo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def marca_veiculo_params
    params.require(:marca_veiculo).permit(:marca)
  end
end
