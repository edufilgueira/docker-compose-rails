
# frozen_string_literal: true

class Socioeduk::JovensController < RecepcaoApplicationController
  before_action :set_socioeduk_jovem, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_jovem').pluralize, :socioeduk_jovens_path
  add_breadcrumb 'Detalhe', :socioeduk_jovem_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_jovem_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_jovem_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_jovens = Socioeduk::Jovem.all
  end

  def show; end

  def new
    @socioeduk_jovem = Socioeduk::Jovem.new
  end

  def edit; end

  def create
    @socioeduk_jovem = Socioeduk::Jovem.new(socioeduk_jovem_params)

    respond_to do |format|
      if @socioeduk_jovem.save
        format.html { redirect_to socioeduk_jovens_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_jovem }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_jovem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_jovem.update(socioeduk_jovem_params)
      redirect_to socioeduk_jovens_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_jovem.destroy
        format.html { redirect_to socioeduk_jovens_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_jovem.errors.full_messages[0] if @socioeduk_jovem.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def cidades_por_estado
    @cidades = Cidade.where(:estado_id => params[:socioeduk_jovem][:uf_naturalidade_id]).order('nome asc')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_jovem
    @socioeduk_jovem = Socioeduk::Jovem.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_jovem_params
    params.require(:socioeduk_jovem).permit(:nome, :apelido, :falecido, :data_nascimento, :sexo, :opcao_sexual_id, :nome_mae, :nome_pai, :peso, :altura, :dependente_quimico, :nacionalidade, :naturalidade, :etnia, :estado_civil_id, :orfao, :responsavel, :mora_com, :numero_filhos, :responsavel_filhos, :tempo_gestacao, :amamentando, :foto, :socioeduk_situacao_adolecente_id, :uf_naturalidade_id, :cidade_naturalidade_id, :idade_estimada, :outras_info_fisica, :cpf, :rg)
  end
end
