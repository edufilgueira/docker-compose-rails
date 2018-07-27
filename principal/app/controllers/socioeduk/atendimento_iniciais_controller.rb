
# frozen_string_literal: true

class Socioeduk::AtendimentoIniciaisController < RecepcaoApplicationController
  before_action :set_socioeduk_atendimento_inicial, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.socioeduk_atendimento_inicial').pluralize, :socioeduk_atendimento_iniciais_path
  add_breadcrumb 'Detalhe', :socioeduk_atendimento_inicial_path, only: [:show]
  add_breadcrumb 'Novo', :new_socioeduk_atendimento_inicial_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_socioeduk_atendimento_inicial_path, only: %i[edit update]

  respond_to :html
  def index
    @socioeduk_atendimento_iniciais = Socioeduk::AtendimentoInicial.all
  end

  def show; end

  def new
    @socioeduk_atendimento_inicial = Socioeduk::AtendimentoInicial.new
  end

  def edit; end

  def create
    @socioeduk_atendimento_inicial = Socioeduk::AtendimentoInicial.new(socioeduk_atendimento_inicial_params)

    respond_to do |format|
      if @socioeduk_atendimento_inicial.save
        format.html { redirect_to socioeduk_atendimento_iniciais_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @socioeduk_atendimento_inicial }
      else
        format.html { render :new }
        format.json { render json: @socioeduk_atendimento_inicial.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @socioeduk_atendimento_inicial.update(socioeduk_atendimento_inicial_params)
      redirect_to socioeduk_atendimento_iniciais_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @socioeduk_atendimento_inicial.destroy
        format.html { redirect_to socioeduk_atendimento_iniciais_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @socioeduk_atendimento_inicial.errors.full_messages[0] if @socioeduk_atendimento_inicial.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_socioeduk_atendimento_inicial
    @socioeduk_atendimento_inicial = Socioeduk::AtendimentoInicial.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def socioeduk_atendimento_inicial_params
    params.require(:socioeduk_atendimento_inicial).permit(:jovem_id, :unidade_socioeducativa_id, :entrada_em, :reincidente, :cumpre_medida, :qual_medida, :cidade_infracao, :bairro_infracao, :busca_apreensao, :cidade_origem_processo, :cidade_execucao_processo, :numero_oficio_bo, :comarca_origem, :procedencia, :numero_processo, :guia_corpo_delito, :alcoolizado, :drogado, :ematomas, :agressor, :observacoes, :nome_condutor, :funcao_condutor, :rg_condutor, :encaminhado, :encaminhado_em, :tipo_desligamento_id, :desligado_em, :deleted_at)
  end
end
