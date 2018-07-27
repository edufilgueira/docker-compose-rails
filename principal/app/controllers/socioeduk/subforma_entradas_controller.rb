
# frozen_string_literal: true

class Socioeduk::SubformaEntradasController < RecepcaoApplicationController
  before_action :set_socioeduk_subforma_entrada, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_subforma_entrada').pluralize, :socioeduk_subforma_entradas_path
  add_breadcrumb 'Detalhe', :socioeduk_subforma_entrada_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_subforma_entrada_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_subforma_entrada_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_subforma_entradas = Socioeduk::SubformaEntrada.all
  end

  def show; end

  def new
    @socioeduk_subforma_entrada = Socioeduk::SubformaEntrada.new
  end

  def edit; end

  def create
    @socioeduk_subforma_entrada = Socioeduk::SubformaEntrada.new(socioeduk_subforma_entrada_params)

    respond_to do |format|
      if @socioeduk_subforma_entrada.save
        format.html { redirect_to socioeduk_subforma_entradas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_subforma_entrada }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_subforma_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_subforma_entrada.update(socioeduk_subforma_entrada_params)
      redirect_to socioeduk_subforma_entradas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_subforma_entrada.destroy
        format.html { redirect_to socioeduk_subforma_entradas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_subforma_entrada.errors.full_messages[0] if @socioeduk_subforma_entrada.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_subforma_entrada
    @socioeduk_subforma_entrada = Socioeduk::SubformaEntrada.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_subforma_entrada_params
    params.require(:socioeduk_subforma_entrada).permit(:descricao, :forma_entrada_id)
  end
end
