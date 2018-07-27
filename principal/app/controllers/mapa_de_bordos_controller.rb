
# frozen_string_literal: true

class MapaDeBordosController < TransporteApplicationController
  before_action :set_mapa_de_bordo, only: %i[show edit update destroy]
  add_breadcrumb I18n.t('activerecord.models.mapa_de_bordo').pluralize, :mapa_de_bordos_path
  add_breadcrumb 'Detalhe', :mapa_de_bordo_path, only: [:show]
  add_breadcrumb 'Novo', :new_mapa_de_bordo_path, only: %i[new create]
  add_breadcrumb 'Editar', :edit_mapa_de_bordo_path, only: %i[edit update]

  respond_to :html
  def index
    @mapa_de_bordos = {
      aberto: MapaDeBordo.aberto,
      finalizado: MapaDeBordo.finalizado
    }

    valid_status_from_params = ['aberto', 'finalizado'] & [params[:status]]
    status = valid_status_from_params.first&.to_sym || :aberto
    @mapas = @mapa_de_bordos [status]
    @mapas.order!(data_vistoria: :desc, hora_inicial: :desc)
  end

  def show
    MapaDeBordo.find(params[:id]).update_attributes(status: 'aberto')
  end

  def new
    @mapa_de_bordo = MapaDeBordo.new
    @motoristas = Motorista.motoristas
    #@responsaveis = Pessoa.all
    @responsaveis = Pessoa.joins('INNER JOIN funcao_pessoas ON funcao_pessoas.pessoa_id = pessoas.id
                                  INNER JOIN funcoes ON funcoes.id = funcao_pessoas.funcao_id')
                                  .where("funcoes.nome = 'Gestor de transporte'")
    @veiculos = Veiculo.all
  end

  def edit
    @motoristas = Pessoa.all
    @responsaveis = Pessoa.all
  end

  def autorizar
   MapaDeBordo.find(params[:id]).update_attributes(status: 'aberto')

    flash[:notice] = 'Autorizado com sucesso!'
    redirect_to action: :index
  end

  def finalizar
   MapaDeBordo.find(params[:id]).update_attributes(status: 'finalizado')

    flash[:notice] = 'Finalizado com sucesso!'
    redirect_to action: :index
  end

  def create
    @mapa_de_bordo = MapaDeBordo.new(mapa_de_bordo_params)
    respond_to do |format|
      if @mapa_de_bordo.save
        @email = current_usuario.email
        EnviarEmailMailer.gerar_mapa_bordo({solicitacao: @mapa_de_bordo, email: @email}).deliver_now
        format.html { redirect_to mapa_de_bordos_url, notice: I18n.t('messages.cadastro_sucesso') }
        format.json { render :show, status: :created, location: @mapa_de_bordo }
      else
        format.html { render :new }
        format.json { render json: @mapa_de_bordo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @mapa_de_bordo.update(mapa_de_bordo_params)
      redirect_to mapa_de_bordos_url, notice: t('messages.atualizado_sucesso')
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @mapa_de_bordo.destroy
        format.html { redirect_to mapa_de_bordos_url, notice: I18n.t('messages.delecao_sucesso') }
      else
        flash[:error] = @mapa_de_bordo.errors.full_messages[0] if @mapa_de_bordo.errors.present?
        format.html { redirect_to :back }
      end
    end
  end

  def imprimir_mapa_bordo
    @mapa_bordo = MapaDeBordo.find(params[:id])
    render template: '/mapa_de_bordos/mapa_bordo_pdf.html.erb', layout: false
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mapa_de_bordo
    @mapa_de_bordo = MapaDeBordo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mapa_de_bordo_params
    params.require(:mapa_de_bordo).permit(:veiculo_id, :tipo_vistoria, :data_vistoria, :responsavel_id, :motorista_id, :km_inicial, :hora_inicial, :km_final, :hora_final, :percurso, :parecer, :status)
  end
end
