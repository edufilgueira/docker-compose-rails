# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :socioeduk do
    resources :jovem_contatos
  end
  namespace :socioeduk do
    resources :tipo_telefones
  end
  namespace :socioeduk do
    resources :jovem_caracteristicas
  end
  resources :unidade_medidas
  namespace :socioeduk do
    resources :tipo_sinais
  end
  namespace :socioeduk do
    resources :endereco_jovens
  end
  namespace :socioeduk do
    resources :situacao_adolescentes
  end
  resources :situacao_adolescentes
  namespace :socioeduk do
    resources :cor_olhos
  end
  namespace :socioeduk do
    resources :raca_cores
  end
  namespace :socioeduk do
    resources :tipo_cabelos
  end
  namespace :socioeduk do
    resources :situacao_adolecentes
  end
  resources :cidades
  resources :estados
  resources :regioes
  resources :motoristas do
    member do
      get :ocupar
      get :ausentar
      get :disponibilizar
    end
  end
  resources :mapa_de_bordos do
    member do
      get :autorizar
      get :finalizar
      get :imprimir_mapa_bordo
    end
  end  
  get 'dashboard_patrimonio/index'

  namespace :recursoshumanos do
    get 'dashboard/index'
  end
  resources :categoria_patrimonios
  namespace :recursoshumanos do
    patch ':cpf/gerar_contrato' => 'vinculos#gerar_contrato', as: 'vinculos_gerar_contrato'
    get 'vinculos/visualizar_contrato' => 'vinculos#visualizar_contrato'

    resources :vinculos do
      collection do
        get :desligamento
      end
    end
  end
  resources :item_patrimonios do
    get 'lista_classes_grupo', on: :collection
  end
  get 'estoque_patrimonio/index'

  resources :tipo_patrimonios
  resources :classe_patrimonios
  resources :grupo_patrimonios
  resources :depositos
  resources :status_patrimonios
  resources :patrimonios do
    collection do
      get :lista_classes_grupo
      match :lista_itens_classe, via: %i[get post]
      match :informacoes_item_patrimonio, via: %i[get post]
      match :lista_areas, via: %i[get post]
      match :lista_subareas, via: %i[get post]
    end
  end
  namespace :recursoshumanos do
    resources :cargos
  end
  namespace :recursoshumanos do
    resources :contratos
  end
  namespace :recursoshumanos do
    resources :tipo_legais
  end
  resources :tipo_solicitacao_transportes
  resources :solicitacao_transportes do
    collection do
      get :justificar_cancelamento
      post :salvar_justificativa_cancelamento
    end
    member do
      get :autorizar
      get :cancelar
    end
  end
  namespace :recursoshumanos do
    resources :tipo_vinculos
  end
  get 'seguranca/index'

  resources :veiculos do  
    member do
      get :ativar
      get :consertar
    end  
  end  
  resources :tipo_de_combustiveis
  resources :funcao_pessoas
  resources :modelos_marcas
  resources :funcoes
  resources :posto_combustiveis
  resources :marca_veiculos
  resources :indicador_assuntos
  resources :local_armazenamentos
  get 'indicadores/relatorio' => 'indicadores#relatorio'
  get 'indicadores/list' => 'indicadores#list'
  resources :coleta_indicadores do
    collection do
      get :preselect
      get 'indicadores_filtered_list/' => 'coleta_indicadores#index', as: 'index_get'
      post 'indicadores_filtered_list/' => 'coleta_indicadores#index', as: 'index'
    end
  end
  resources :indicadores
  resources :indicador_unidade_medidas
  resources :material_movimentacoes
  resources :capacidades_diarias
  resources :capacidades_originais
  resources :classe_materiais
  resources :permissoes do
    get 'duplicate'
  end
  resources :servicos_realizados
  resources :servicos
  resources :gestores_unidades
  resources :gestores_areas
  resources :gestores_eixos
  resources :socioeducandos_atendidos
  resources :pessoas do
    collection do
      get :contratacao
    end
  end
  resources :areas
  resources :unidades_socioeducativas
  resources :materiais
  resources :unidades_medidas
  resources :grupo_materiais
  resources :eixos

  get 'sistemas_socioeduk' => 'home#sistemas_socioeduk'
  get 'sistemas' => 'home#sistemas'
  get 'filtra_eixos' => 'gestores_eixos#eixos'
  get 'filtra_areas' => 'gestores_areas#areas'
  get 'filtra_unidades' => 'gestores_unidades#unidades'
  get 'socioeducandos_atendidos/filter/:unidade/:ano/:mes' => 'socioeducandos_atendidos#filter'

  devise_for :usuarios, controllers: { sessions: 'usuarios/sessions', registrations: 'usuarios/registrations' }, path_names: { sign_in: 'login', sign_out: 'logout' }

  devise_scope :usuario do
    root to: 'home#sistemas'
  end

  post 'admin/usuarios/calcular'
  namespace :admin do
    resources :usuarios do
      get 'redefinir_senha'
      collection do
        get 'buscar_usuario_cpf'
      end
    end
  end

  namespace :socioeduk do
    match 'jovens/cidades_por_estado', via: [:get, :post]
    resources :jovens do
      resources :admissoes do
        resources :admissao_anexos, as: :anexos
        resources :transferencias
        resources :infracoes
        resources :evasoes
      end
      resources :deficiencias
      resources :marca_corporais
      resources :contatos
      resources :enderecos
      resources :documentos
      resources :atendimento_iniciais do
        resources :infracao_preliminares
      end
    end
    resources :decisao_judiciais
    resources :atendimento_inicial_documentos
    resources :documento_forma_entradas
    resources :subforma_entradas
    resources :forma_entradas
    resources :tipo_desligamentos
    resources :tipo_contatos
    resources :opcao_sexuais
    resources :tipo_marca_corporais
    resources :tipo_infracoes
    resources :tipo_deficiencias
  end
end
