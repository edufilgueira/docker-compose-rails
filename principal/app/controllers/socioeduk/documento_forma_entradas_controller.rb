
# frozen_string_literal: true

class Socioeduk::DocumentoFormaEntradasController < RecepcaoApplicationController
  before_action :set_socioeduk_documento_forma_entrada, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_documento_forma_entrada').pluralize, :socioeduk_documento_forma_entradas_path
  add_breadcrumb 'Detalhe', :socioeduk_documento_forma_entrada_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_documento_forma_entrada_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_documento_forma_entrada_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_documento_forma_entradas = Socioeduk::DocumentoFormaEntrada.all
  end

  def show; end

  def new
    @socioeduk_documento_forma_entrada = Socioeduk::DocumentoFormaEntrada.new
  end

  def edit; end

  def create
    @socioeduk_documento_forma_entrada = Socioeduk::DocumentoFormaEntrada.new(socioeduk_documento_forma_entrada_params)

    respond_to do |format|
      if @socioeduk_documento_forma_entrada.save
        format.html { redirect_to socioeduk_documento_forma_entradas_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_documento_forma_entrada }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_documento_forma_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_documento_forma_entrada.update(socioeduk_documento_forma_entrada_params)
      redirect_to socioeduk_documento_forma_entradas_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_documento_forma_entrada.destroy
        format.html { redirect_to socioeduk_documento_forma_entradas_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_documento_forma_entrada.errors.full_messages[0] if @socioeduk_documento_forma_entrada.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_documento_forma_entrada
    @socioeduk_documento_forma_entrada = Socioeduk::DocumentoFormaEntrada.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_documento_forma_entrada_params
    params.require(:socioeduk_documento_forma_entrada).permit(:descricao, :obrigatorio, :forma_entrada_id, :subforma_entrada_id)
  end
end
