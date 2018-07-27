
# frozen_string_literal: true

class Socioeduk::FormaEntradasController < RecepcaoApplicationController
  before_action :set_socioeduk_forma_entrada, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_forma_entrada').pluralize, :socioeduk_forma_entradas_path
  add_breadcrumb 'Detalhe', :socioeduk_forma_entrada_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_forma_entrada_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_forma_entrada_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_forma_entradas = Socioeduk::FormaEntrada.all
  end

  def show; end

  def new
    @socioeduk_forma_entrada = Socioeduk::FormaEntrada.new
  end

  def edit; end

  def create
    @socioeduk_forma_entrada = Socioeduk::FormaEntrada.new(socioeduk_forma_entrada_params)

    respond_to do |format|
      if @socioeduk_forma_entrada.save
        format.html { redirect_to socioeduk_forma_entradas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_forma_entrada }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_forma_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_forma_entrada.update(socioeduk_forma_entrada_params)
      redirect_to socioeduk_forma_entradas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_forma_entrada.destroy
        format.html { redirect_to socioeduk_forma_entradas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_forma_entrada.errors.full_messages[0] if @socioeduk_forma_entrada.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_forma_entrada
    @socioeduk_forma_entrada = Socioeduk::FormaEntrada.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_forma_entrada_params
    params.require(:socioeduk_forma_entrada).permit(:descricao)
  end
end
