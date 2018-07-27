
# frozen_string_literal: true

class Socioeduk::ContatosController < RecepcaoApplicationController
  before_action :set_socioeduk_contato, only: %i[show edit update destroy]
  before_action :set_jovem
  add_breadcrumb I18n.t('activerecord.models.socioeduk_contato').pluralize, :socioeduk_jovem_contatos_path
  add_breadcrumb 'Detalhe', :socioeduk_jovem_contato_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_jovem_contato_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_jovem_contato_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_contatos = Socioeduk::Contato.all
  end

  def show; end

  def new
    @socioeduk_contato = Socioeduk::Contato.new
    @url = :socioeduk_jovem_contatos
  end

  def edit
    @url = :socioeduk_jovem_contato
  end

  def create
    @socioeduk_contato = Socioeduk::Contato.new(socioeduk_contato_params)
    @socioeduk_contato.jovem = @socioeduk_jovem

    if @socioeduk_contato.save
      redirect_to @socioeduk_jovem, notice: I18n.t('messages.cadastro_sucesso')
    else
      @url = :socioeduk_jovem_contatos
      render :new
    end
  end

  def update
    if @socioeduk_contato.update(socioeduk_contato_params)
      redirect_to @socioeduk_jovem, notice: t('messages.atualizado_sucesso')
    else
      @url = :socioeduk_jovem_contato
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_contato.destroy
        format.html { redirect_to @socioeduk_jovem, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_contato.errors.full_messages[0] if @socioeduk_contato.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_contato
    @socioeduk_contato = Socioeduk::Contato.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_contato_params
    params.require(:socioeduk_contato).permit(:jovem_id, :tipo_contato_id, :ddd, :numero)
  end

  def set_jovem
    @socioeduk_jovem = Socioeduk::Jovem.find(params[:jovem_id])
  end
end
