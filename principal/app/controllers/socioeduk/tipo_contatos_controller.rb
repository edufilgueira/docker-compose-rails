
# frozen_string_literal: true

class Socioeduk::TipoContatosController < RecepcaoApplicationController
  before_action :set_socioeduk_tipo_contato, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_tipo_contato').pluralize, :socioeduk_tipo_contatos_path
  add_breadcrumb 'Detalhe', :socioeduk_tipo_contato_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_tipo_contato_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_tipo_contato_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_tipo_contatos = Socioeduk::TipoContato.all
  end

  def show; end

  def new
    @socioeduk_tipo_contato = Socioeduk::TipoContato.new
  end

  def edit; end

  def create
    @socioeduk_tipo_contato = Socioeduk::TipoContato.new(socioeduk_tipo_contato_params)

    respond_to do |format|
      if @socioeduk_tipo_contato.save
        format.html { redirect_to socioeduk_tipo_contatos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_tipo_contato }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_tipo_contato.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_tipo_contato.update(socioeduk_tipo_contato_params)
      redirect_to socioeduk_tipo_contatos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_tipo_contato.destroy
        format.html { redirect_to socioeduk_tipo_contatos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_tipo_contato.errors.full_messages[0] if @socioeduk_tipo_contato.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_tipo_contato
    @socioeduk_tipo_contato = Socioeduk::TipoContato.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_tipo_contato_params
    params.require(:socioeduk_tipo_contato).permit(:descricao)
  end
end
