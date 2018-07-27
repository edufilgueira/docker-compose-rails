
# frozen_string_literal: true

class DepositosController < PatrimonioApplicationController
  before_action :set_deposito, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.deposito').pluralize, :depositos_path
  add_breadcrumb 'Detalhe', :deposito_path, only: [:show]
  add_breadcrumb 'Novo', :new_deposito_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_deposito_path, only: %i[edit update]

  respond_to :html
  def index
    @depositos = Deposito.all
  end

  def show; end

  def new
    @deposito = Deposito.new
  end

  def edit; end

  def create
    @deposito = Deposito.new(deposito_params)

    respond_to do |format|
      if @deposito.save
        format.html { redirect_to depositos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @deposito }
      else
        format.html { render :new }
        format.json { render json: @deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @deposito.update(deposito_params)
      redirect_to depositos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @deposito.destroy
        format.html { redirect_to depositos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @deposito.errors.full_messages[0] if @deposito.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deposito
    @deposito = Deposito.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def deposito_params
    params.require(:deposito).permit(:nome)
  end
end
