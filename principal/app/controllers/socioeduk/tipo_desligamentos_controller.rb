
# frozen_string_literal: true

class Socioeduk::TipoDesligamentosController < RecepcaoApplicationController
  before_action :set_socioeduk_tipo_desligamento, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_tipo_desligamento').pluralize, :socioeduk_tipo_desligamentos_path
  add_breadcrumb 'Detalhe', :socioeduk_tipo_desligamento_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_tipo_desligamento_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_tipo_desligamento_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_tipo_desligamentos = Socioeduk::TipoDesligamento.all
  end

  def show; end

  def new
    @socioeduk_tipo_desligamento = Socioeduk::TipoDesligamento.new
  end

  def edit; end

  def create
    @socioeduk_tipo_desligamento = Socioeduk::TipoDesligamento.new(socioeduk_tipo_desligamento_params)

    respond_to do |format|
      if @socioeduk_tipo_desligamento.save
        format.html { redirect_to socioeduk_tipo_desligamentos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_tipo_desligamento }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_desligamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_desligamento.update(socioeduk_tipo_desligamento_params)
      redirect_to socioeduk_tipo_desligamentos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_desligamento.destroy
        format.html { redirect_to socioeduk_tipo_desligamentos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_tipo_desligamento.errors.full_messages[0] if @socioeduk_tipo_desligamento.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_tipo_desligamento
    @socioeduk_tipo_desligamento = Socioeduk::TipoDesligamento.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_tipo_desligamento_params
    params.require(:socioeduk_tipo_desligamento).permit(:descricao)
  end
end
