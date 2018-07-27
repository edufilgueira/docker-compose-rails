# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180726125349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "andamentos", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "destinatario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "carga_type"
    t.bigint "carga_id"
    t.index ["carga_type", "carga_id"], name: "index_andamentos_on_carga_type_and_carga_id"
    t.index ["destinatario_id"], name: "index_andamentos_on_destinatario_id"
    t.index ["usuario_id"], name: "index_andamentos_on_usuario_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "nome"
    t.integer "subarea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "sigla", limit: 10
    t.bigint "unidade_socioeducativa_id"
    t.index ["unidade_socioeducativa_id"], name: "index_areas_on_unidade_socioeducativa_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "capacidades_diarias", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.integer "capacidade"
    t.date "data_referencia"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_capacidades_diarias_on_unidade_socioeducativa_id"
    t.index ["usuario_id"], name: "index_capacidades_diarias_on_usuario_id"
  end

  create_table "capacidades_originais", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.integer "capacidade"
    t.date "data_referencia"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_capacidades_originais_on_unidade_socioeducativa_id"
    t.index ["usuario_id"], name: "index_capacidades_originais_on_usuario_id"
  end

  create_table "categoria_patrimonios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.boolean "capital"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "classe_materiais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grupo_material_id"
    t.integer "codigo"
    t.index ["grupo_material_id"], name: "index_classe_materiais_on_grupo_material_id"
  end

  create_table "classe_patrimonios", force: :cascade do |t|
    t.bigint "grupo_patrimonio_id"
    t.string "codigo"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupo_patrimonio_id"], name: "index_classe_patrimonios_on_grupo_patrimonio_id"
  end

  create_table "coleta_indicadores", force: :cascade do |t|
    t.bigint "indicador_id"
    t.string "abrangencia_coleta"
    t.integer "area_id"
    t.integer "pessoa_id"
    t.string "indice"
    t.integer "semestre"
    t.integer "quadrimestre"
    t.integer "trimestre"
    t.integer "mes"
    t.integer "quinzena"
    t.integer "semana"
    t.integer "ano"
    t.string "periodo_coleta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dia"
    t.index ["indicador_id"], name: "index_coleta_indicadores_on_indicador_id"
  end

  create_table "depositos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eixos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "acronym"
    t.bigint "regiao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regiao_id"], name: "index_estados_on_regiao_id"
  end

  create_table "funcao_pessoas", force: :cascade do |t|
    t.bigint "funcao_id"
    t.bigint "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcao_id"], name: "index_funcao_pessoas_on_funcao_id"
    t.index ["pessoa_id"], name: "index_funcao_pessoas_on_pessoa_id"
  end

  create_table "funcoes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.index ["area_id"], name: "index_funcoes_on_area_id"
  end

  create_table "gestores_areas", force: :cascade do |t|
    t.bigint "area_id"
    t.bigint "pessoa_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["area_id"], name: "index_gestores_areas_on_area_id"
    t.index ["pessoa_id"], name: "index_gestores_areas_on_pessoa_id"
  end

  create_table "gestores_eixos", force: :cascade do |t|
    t.bigint "eixo_id"
    t.bigint "pessoa_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["eixo_id"], name: "index_gestores_eixos_on_eixo_id"
    t.index ["pessoa_id"], name: "index_gestores_eixos_on_pessoa_id"
  end

  create_table "gestores_unidades", force: :cascade do |t|
    t.bigint "unidade_socioeducativa_id"
    t.bigint "pessoa_id"
    t.date "data_inicio"
    t.date "data_termino"
    t.boolean "ativo", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["pessoa_id"], name: "index_gestores_unidades_on_pessoa_id"
    t.index ["unidade_socioeducativa_id"], name: "index_gestores_unidades_on_unidade_socioeducativa_id"
  end

  create_table "grupo_materiais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "codigo"
  end

  create_table "grupo_patrimonios", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categoria_patrimonio_id"
    t.index ["categoria_patrimonio_id"], name: "index_grupo_patrimonios_on_categoria_patrimonio_id"
  end

  create_table "indicador_assuntos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicador_unidade_medidas", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicadores", force: :cascade do |t|
    t.bigint "indicador_unidade_medida_id"
    t.bigint "area_id"
    t.string "melhor_sentido"
    t.text "objetivo"
    t.string "abrangencia"
    t.string "periodicidade_coleta"
    t.text "como_coletar"
    t.string "periodicidade_avaliacao"
    t.text "como_calcular"
    t.string "assunto"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "indicador_assunto_id"
    t.index ["area_id"], name: "index_indicadores_on_area_id"
    t.index ["indicador_unidade_medida_id"], name: "index_indicadores_on_indicador_unidade_medida_id"
  end

  create_table "item_patrimonios", force: :cascade do |t|
    t.bigint "classe_patrimonio_id"
    t.bigint "tipo_patrimonio_id"
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.datetime "deleted_at"
    t.index ["classe_patrimonio_id"], name: "index_item_patrimonios_on_classe_patrimonio_id"
    t.index ["deleted_at"], name: "index_item_patrimonios_on_deleted_at"
    t.index ["tipo_patrimonio_id"], name: "index_item_patrimonios_on_tipo_patrimonio_id"
  end

  create_table "local_armazenamentos", force: :cascade do |t|
    t.string "descricao_local"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unidade_socioeducativa_id"], name: "index_local_armazenamentos_on_unidade_socioeducativa_id"
  end

  create_table "mapa_de_bordos", force: :cascade do |t|
    t.bigint "veiculo_id"
    t.integer "tipo_vistoria"
    t.date "data_vistoria"
    t.bigint "responsavel_id"
    t.bigint "motorista_id"
    t.float "km_inicial"
    t.datetime "hora_inicial"
    t.float "km_final"
    t.datetime "hora_final"
    t.text "percurso"
    t.text "parecer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["motorista_id"], name: "index_mapa_de_bordos_on_motorista_id"
    t.index ["responsavel_id"], name: "index_mapa_de_bordos_on_responsavel_id"
    t.index ["veiculo_id"], name: "index_mapa_de_bordos_on_veiculo_id"
  end

  create_table "marca_veiculos", force: :cascade do |t|
    t.string "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materiais", force: :cascade do |t|
    t.string "nome"
    t.bigint "unidades_medida_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descricao"
    t.bigint "classe_material_id"
    t.bigint "local_armazenamento_id"
    t.decimal "quantidade"
    t.index ["classe_material_id"], name: "index_materiais_on_classe_material_id"
    t.index ["local_armazenamento_id"], name: "index_materiais_on_local_armazenamento_id"
    t.index ["unidades_medida_id"], name: "index_materiais_on_unidades_medida_id"
  end

  create_table "material_movimentacoes", force: :cascade do |t|
    t.bigint "material_id"
    t.bigint "unidade_socioeducativa_id"
    t.integer "quantidade_movimentada"
    t.string "tipo_movimentacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_material_movimentacoes_on_material_id"
    t.index ["unidade_socioeducativa_id"], name: "index_material_movimentacoes_on_unidade_socioeducativa_id"
  end

  create_table "modelos_marcas", force: :cascade do |t|
    t.string "modelo"
    t.bigint "marca_veiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_veiculo_id"], name: "index_modelos_marcas_on_marca_veiculo_id"
  end

  create_table "motoristas", force: :cascade do |t|
    t.string "numero"
    t.string "registro"
    t.date "validade"
    t.string "categoria"
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pessoa_id"
    t.string "status"
    t.index ["pessoa_id"], name: "index_motoristas_on_pessoa_id"
  end

  create_table "patrimonios", force: :cascade do |t|
    t.string "tombo_anterior"
    t.string "origem_anterior"
    t.string "tombo_atual"
    t.string "origem_atual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_patrimonio_id"
    t.bigint "deposito_id"
    t.string "ciclo_vida_util"
    t.decimal "valor"
    t.string "nota_fiscal"
    t.bigint "item_patrimonio_id"
    t.integer "subarea_id"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "deleted_at"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_patrimonios_on_area_id"
    t.index ["deleted_at"], name: "index_patrimonios_on_deleted_at"
    t.index ["deposito_id"], name: "index_patrimonios_on_deposito_id"
    t.index ["item_patrimonio_id"], name: "index_patrimonios_on_item_patrimonio_id"
    t.index ["status_patrimonio_id"], name: "index_patrimonios_on_status_patrimonio_id"
    t.index ["unidade_socioeducativa_id"], name: "index_patrimonios_on_unidade_socioeducativa_id"
  end

  create_table "permissoes", force: :cascade do |t|
    t.string "perfil"
    t.text "recursos", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "usuario_id"
    t.string "nome_pai"
    t.string "nome_mae"
    t.string "estado_civil"
    t.string "conjuge"
    t.string "profissao"
    t.date "data_nascimento"
    t.string "naturalidade"
    t.string "uf"
    t.string "tipo_sanguineo"
    t.string "sexo"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "cep"
    t.string "telefone"
    t.string "celular"
    t.string "pis"
    t.string "ctps"
    t.string "serie"
    t.string "rg"
    t.string "emissor"
    t.string "emissao"
    t.string "certificado_militar"
    t.string "emissor_militar"
    t.string "banco"
    t.string "agencia"
    t.string "conta_corrente"
    t.string "titulo_eleitoral"
    t.string "zona"
    t.string "secao"
    t.date "data_contratacao"
    t.string "email_pessoal"
    t.string "cidade_eleitoral"
    t.string "estado_eleitoral"
    t.index ["usuario_id"], name: "index_pessoas_on_usuario_id"
  end

  create_table "posto_combustiveis", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursoshumanos_cargos", force: :cascade do |t|
    t.string "nome"
    t.integer "quantidade"
    t.bigint "contrato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "simbolo"
    t.index ["contrato_id"], name: "index_recursoshumanos_cargos_on_contrato_id"
  end

  create_table "recursoshumanos_contratos", force: :cascade do |t|
    t.bigint "recursoshumanos_tipo_legal_id"
    t.bigint "recursoshumanos_tipo_vinculo_id"
    t.string "inicio"
    t.integer "numero"
    t.integer "ano"
    t.string "doe_ce"
    t.date "data_doe_ce"
    t.integer "pagina_doe_ce"
    t.date "inicio_vigencia"
    t.date "final_vigencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recursoshumanos_tipo_legal_id"], name: "rec_hum_tip_legal"
    t.index ["recursoshumanos_tipo_vinculo_id"], name: "rec_hum_vinc_legal"
  end

  create_table "recursoshumanos_tipo_legais", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recursoshumanos_tipo_vinculo_id"
    t.index ["recursoshumanos_tipo_vinculo_id"], name: "rec_tipo_legal_tipo_vinculo"
  end

  create_table "recursoshumanos_tipo_vinculos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursoshumanos_vinculos", force: :cascade do |t|
    t.date "data_inicio"
    t.date "data_fim"
    t.bigint "recursoshumanos_cargo_id"
    t.bigint "pessoas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoas_id"], name: "index_recursoshumanos_vinculos_on_pessoas_id"
    t.index ["recursoshumanos_cargo_id"], name: "index_recursoshumanos_vinculos_on_recursoshumanos_cargo_id"
  end

  create_table "regioes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.bigint "eixo_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["eixo_id"], name: "index_servicos_on_eixo_id"
  end

  create_table "servicos_realizados", force: :cascade do |t|
    t.bigint "eixo_id"
    t.bigint "gestor_eixo_id"
    t.bigint "unidade_socioeducativa_id"
    t.bigint "gestor_unidade_id"
    t.bigint "area_id"
    t.bigint "gestor_area_id"
    t.bigint "qtd_socioeducandos_atendidos"
    t.bigint "servico_id"
    t.integer "quantidade_realizados"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "meta"
    t.decimal "desempenho_meta", precision: 8, scale: 2
    t.integer "ano"
    t.integer "mes"
    t.index ["area_id"], name: "index_servicos_realizados_on_area_id"
    t.index ["eixo_id"], name: "index_servicos_realizados_on_eixo_id"
    t.index ["gestor_area_id"], name: "index_servicos_realizados_on_gestor_area_id"
    t.index ["gestor_eixo_id"], name: "index_servicos_realizados_on_gestor_eixo_id"
    t.index ["gestor_unidade_id"], name: "index_servicos_realizados_on_gestor_unidade_id"
    t.index ["qtd_socioeducandos_atendidos"], name: "index_servicos_realizados_on_qtd_socioeducandos_atendidos"
    t.index ["servico_id"], name: "index_servicos_realizados_on_servico_id"
    t.index ["unidade_socioeducativa_id"], name: "index_servicos_realizados_on_unidade_socioeducativa_id"
  end

  create_table "socioeducandos_atendidos", force: :cascade do |t|
    t.integer "ano"
    t.integer "mes", limit: 2
    t.bigint "unidade_socioeducativa_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeducandos_atendidos_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_admissao_anexos", force: :cascade do |t|
    t.bigint "jovem_id"
    t.string "kit_file_name"
    t.string "kit_content_type"
    t.integer "kit_file_size"
    t.datetime "kit_updated_at"
    t.string "documentos_file_name"
    t.string "documentos_content_type"
    t.integer "documentos_file_size"
    t.datetime "documentos_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_admissao_anexos_on_jovem_id"
  end

  create_table "socioeduk_admissoes", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "rebebido_em"
    t.integer "tipo_desligamento_id"
    t.datetime "desligado_em"
    t.string "numero_processo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_admissoes_on_jovem_id"
    t.index ["unidade_socioeducativa_id"], name: "index_socioeduk_admissoes_on_unidade_socioeducativa_id"
  end

  create_table "socioeduk_atendimento_iniciais", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "unidade_socioeducativa_id"
    t.datetime "entrada_em"
    t.boolean "reincidente"
    t.boolean "cumpre_medida"
    t.string "qual_medida"
    t.string "cidade_infracao"
    t.string "bairro_infracao"
    t.boolean "busca_apreensao"
    t.integer "cidade_origem_processo"
    t.integer "cidade_execucao_processo"
    t.string "numero_oficio_bo"
    t.string "comarca_origem"
    t.string "procedencia"
    t.string "numero_processo"
    t.boolean "guia_corpo_delito"
    t.boolean "alcoolizado"
    t.boolean "drogado"
    t.boolean "ematomas"
    t.string "agressor"
    t.text "observacoes"
    t.string "nome_condutor"
    t.string "funcao_condutor"
    t.string "rg_condutor"
    t.boolean "encaminhado"
    t.datetime "encaminhado_em"
    t.bigint "tipo_desligamento_id"
    t.datetime "desligado_em"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "forma_entrada_id"
    t.bigint "subforma_entrada_id"
    t.index ["forma_entrada_id"], name: "index_socioeduk_atendimento_iniciais_on_forma_entrada_id"
    t.index ["jovem_id"], name: "index_socioeduk_atendimento_iniciais_on_jovem_id"
    t.index ["subforma_entrada_id"], name: "index_socioeduk_atendimento_iniciais_on_subforma_entrada_id"
    t.index ["tipo_desligamento_id"], name: "index_socioeduk_atendimento_iniciais_on_tipo_desligamento_id"
    t.index ["unidade_socioeducativa_id"], name: "atend_inicial_unid_socio"
  end

  create_table "socioeduk_atendimento_inicial_documentos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "atendimento_inicial_id"
    t.bigint "documento_forma_entrada_id"
    t.string "documento_file_name"
    t.string "documento_content_type"
    t.integer "documento_file_size"
    t.datetime "documento_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["atendimento_inicial_id"], name: "index_socioeduk_atendimento_ini_doc_on_atend_ini_id"
    t.index ["documento_forma_entrada_id"], name: "index_socioeduk_atend_ini_docu_on_doc_form_ent_id"
  end

  create_table "socioeduk_contatos", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "tipo_contato_id"
    t.integer "ddd"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_contatos_on_jovem_id"
    t.index ["tipo_contato_id"], name: "index_socioeduk_contatos_on_tipo_contato_id"
  end

  create_table "socioeduk_cor_olhos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_decisao_judiciais", force: :cascade do |t|
    t.string "descricao"
    t.bigint "atendimento_inicial_id"
    t.string "documento_file_name"
    t.string "documento_content_type"
    t.integer "documento_file_size"
    t.datetime "documento_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["atendimento_inicial_id"], name: "index_socioeduk_decisao_judiciais_on_atendimento_inicial_id"
  end

  create_table "socioeduk_deficiencias", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "deficiencias_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deficiencias_id"], name: "index_socioeduk_deficiencias_on_deficiencias_id"
    t.index ["jovem_id"], name: "index_socioeduk_deficiencias_on_jovem_id"
  end

  create_table "socioeduk_documento_forma_entradas", force: :cascade do |t|
    t.string "descricao"
    t.boolean "obrigatorio"
    t.bigint "forma_entrada_id"
    t.bigint "subforma_entrada_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["forma_entrada_id"], name: "index_socioeduk_documento_forma_entradas_on_forma_entrada_id"
    t.index ["subforma_entrada_id"], name: "index_socioeduk_documento_forma_entradas_on_subforma_entrada_id"
  end

  create_table "socioeduk_documentos", force: :cascade do |t|
    t.bigint "jovem_id"
    t.string "cpf"
    t.string "rg_numero"
    t.date "rg_data_emissao"
    t.string "rg_orgao_emissor"
    t.string "rg_uf_emissao"
    t.string "certidao_nascimento"
    t.string "certidao_numero"
    t.string "certidao_pagina"
    t.string "certidao_livro"
    t.date "certidao_data_emissao"
    t.string "certidao_uf_emissao"
    t.string "cpts_numero"
    t.string "ctps_serie"
    t.string "ctps_data_emissao"
    t.string "ctps_uf_emissao"
    t.string "titulo_numero"
    t.string "titulo_serie"
    t.string "titulo_secao"
    t.string "pis_numero"
    t.string "reservista_numero"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jovem_id"], name: "index_socioeduk_documentos_on_jovem_id"
  end

  create_table "socioeduk_endereco_jovens", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "cidade_id"
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_socioeduk_endereco_jovens_on_cidade_id"
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_endereco_jovens_on_socioeduk_jovem_id"
  end

  create_table "socioeduk_enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "complemento"
    t.string "cidade"
    t.string "estado"
    t.string "ponto_referencia"
    t.integer "tipo_contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "jovem_id"
    t.index ["jovem_id"], name: "index_socioeduk_enderecos_on_jovem_id"
  end

  create_table "socioeduk_evasoes", force: :cascade do |t|
    t.bigint "jovem_id"
    t.datetime "data_evasao"
    t.boolean "evadido"
    t.datetime "retornou_em"
    t.integer "tipo_evasao"
    t.text "observacoes"
    t.string "motivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_evasoes_on_jovem_id"
  end

  create_table "socioeduk_forma_entradas", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_infracao_preliminares", force: :cascade do |t|
    t.bigint "atendimento_inicial_id"
    t.bigint "tipo_infracao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["atendimento_inicial_id"], name: "index_socioeduk_infracao_preliminares_on_atendimento_inicial_id"
    t.index ["tipo_infracao_id"], name: "index_socioeduk_infracao_preliminares_on_tipo_infracao_id"
  end

  create_table "socioeduk_infracoes", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "tipo_infracao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_infracoes_on_jovem_id"
    t.index ["tipo_infracao_id"], name: "index_socioeduk_infracoes_on_tipo_infracao_id"
  end

  create_table "socioeduk_jovem_caracteristicas", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_sinal_id"
    t.string "local_sinal"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "jovem"
    t.index ["socioeduk_tipo_sinal_id"], name: "tipo_sinal"
  end

  create_table "socioeduk_jovem_contatos", force: :cascade do |t|
    t.bigint "socioeduk_jovem_id"
    t.bigint "socioeduk_tipo_contato_id"
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["socioeduk_jovem_id"], name: "index_socioeduk_jovem_contatos_on_socioeduk_jovem_id"
    t.index ["socioeduk_tipo_contato_id"], name: "index_socioeduk_jovem_contatos_on_socioeduk_tipo_contato_id"
  end

  create_table "socioeduk_jovens", force: :cascade do |t|
    t.string "nome"
    t.string "apelido"
    t.boolean "falecido"
    t.date "data_nascimento"
    t.integer "sexo"
    t.bigint "opcao_sexual_id"
    t.string "nome_mae"
    t.string "nome_pai"
    t.decimal "peso"
    t.decimal "altura"
    t.boolean "dependente_quimico"
    t.string "nacionalidade"
    t.string "naturalidade"
    t.string "etnia"
    t.string "estado_civil_id"
    t.boolean "orfao"
    t.string "responsavel"
    t.string "mora_com"
    t.integer "numero_filhos"
    t.string "responsavel_filhos"
    t.string "tempo_gestacao"
    t.boolean "amamentando"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "socioeduk_situacao_adolescente_id"
    t.integer "uf_naturalidade_id"
    t.integer "cidade_naturalidade_id"
    t.integer "idade_estimada"
    t.string "outras_info_fisica"
    t.boolean "reside_fora_pais"
    t.string "cpf"
    t.string "rg"
    t.string "orgao_expedidor"
    t.boolean "providenciando_documentos"
    t.bigint "socioeduk_tipo_cabelo_id"
    t.bigint "socioeduk_cor_olhos_id"
    t.bigint "socioeduk_raca_cor_id"
    t.index ["opcao_sexual_id"], name: "index_socioeduk_jovens_on_opcao_sexual_id"
    t.index ["socioeduk_cor_olhos_id"], name: "index_socioeduk_jovens_on_socioeduk_cor_olhos_id"
    t.index ["socioeduk_raca_cor_id"], name: "index_socioeduk_jovens_on_socioeduk_raca_cor_id"
    t.index ["socioeduk_situacao_adolescente_id"], name: "index_socioeduk_jovens_on_socioeduk_situacao_adolescente_id"
    t.index ["socioeduk_tipo_cabelo_id"], name: "index_socioeduk_jovens_on_socioeduk_tipo_cabelo_id"
  end

  create_table "socioeduk_marca_corporais", force: :cascade do |t|
    t.bigint "jovem_id"
    t.bigint "marca_corporal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["jovem_id"], name: "index_socioeduk_marca_corporais_on_jovem_id"
    t.index ["marca_corporal_id"], name: "index_socioeduk_marca_corporais_on_marca_corporal_id"
  end

  create_table "socioeduk_opcao_sexuais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_raca_cores", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_situacao_adolescentes", force: :cascade do |t|
    t.string "descricao"
    t.boolean "remocao_fila"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_subforma_entradas", force: :cascade do |t|
    t.string "descricao"
    t.bigint "forma_entrada_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["forma_entrada_id"], name: "index_socioeduk_subforma_entradas_on_forma_entrada_id"
  end

  create_table "socioeduk_tipo_cabelos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_contatos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_deficiencias", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_desligamentos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_infracoes", force: :cascade do |t|
    t.string "artigo"
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_marca_corporais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "socioeduk_tipo_sinais", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_tipo_telefones", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socioeduk_transferencias", force: :cascade do |t|
    t.integer "unidade_socioeducativa_origem_id"
    t.integer "unidade_socioeducativa_destino_id"
    t.bigint "admissao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["admissao_id"], name: "index_socioeduk_transferencias_on_admissao_id"
  end

  create_table "solicitacao_transportes", force: :cascade do |t|
    t.bigint "tipo_solicitacao_transporte_id"
    t.bigint "area_id"
    t.integer "destinado_para_id"
    t.date "data_transporte"
    t.date "data_retorno"
    t.time "hora_solicitada"
    t.time "hora_prevista_retorno"
    t.string "destino"
    t.string "justificativa"
    t.boolean "urgente"
    t.string "justificativa_urgencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "origem"
    t.string "status"
    t.text "justificativa_cancelamento"
    t.index ["area_id"], name: "index_solicitacao_transportes_on_area_id"
    t.index ["tipo_solicitacao_transporte_id"], name: "index_solicitacao_transportes_on_tipo_solicitacao_transporte_id"
  end

  create_table "status_patrimonios", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
  end

  create_table "tipo_de_combustiveis", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_patrimonios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_solicitacao_transportes", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidade_medidas", force: :cascade do |t|
    t.string "descricao"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades_medidas", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades_socioeducativas", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "recepcao"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "permissao_id"
    t.string "cargo"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_usuarios_on_authentication_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["permissao_id"], name: "index_usuarios_on_permissao_id"
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.decimal "km"
    t.bigint "modelos_marca_id"
    t.bigint "tipo_de_combustivel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ano_fab"
    t.string "ano_mod"
    t.string "renavam"
    t.string "chassi"
    t.string "cor"
    t.string "lotacao"
    t.string "avalicao"
    t.bigint "marca_veiculo_id"
    t.string "status"
    t.index ["marca_veiculo_id"], name: "index_veiculos_on_marca_veiculo_id"
    t.index ["modelos_marca_id"], name: "index_veiculos_on_modelos_marca_id"
    t.index ["tipo_de_combustivel_id"], name: "index_veiculos_on_tipo_de_combustivel_id"
  end

  add_foreign_key "andamentos", "areas", column: "destinatario_id"
  add_foreign_key "andamentos", "usuarios"
  add_foreign_key "areas", "unidades_socioeducativas"
  add_foreign_key "capacidades_diarias", "unidades_socioeducativas"
  add_foreign_key "capacidades_diarias", "usuarios"
  add_foreign_key "capacidades_originais", "unidades_socioeducativas"
  add_foreign_key "capacidades_originais", "usuarios"
  add_foreign_key "cidades", "estados"
  add_foreign_key "classe_materiais", "grupo_materiais"
  add_foreign_key "classe_patrimonios", "grupo_patrimonios"
  add_foreign_key "coleta_indicadores", "indicadores"
  add_foreign_key "estados", "regioes"
  add_foreign_key "funcao_pessoas", "funcoes"
  add_foreign_key "funcao_pessoas", "pessoas"
  add_foreign_key "funcoes", "areas"
  add_foreign_key "gestores_areas", "areas"
  add_foreign_key "gestores_areas", "pessoas"
  add_foreign_key "gestores_eixos", "eixos"
  add_foreign_key "gestores_eixos", "pessoas"
  add_foreign_key "gestores_unidades", "pessoas"
  add_foreign_key "gestores_unidades", "unidades_socioeducativas"
  add_foreign_key "grupo_patrimonios", "categoria_patrimonios"
  add_foreign_key "indicadores", "areas"
  add_foreign_key "indicadores", "indicador_assuntos"
  add_foreign_key "indicadores", "indicador_unidade_medidas"
  add_foreign_key "item_patrimonios", "classe_patrimonios"
  add_foreign_key "item_patrimonios", "tipo_patrimonios"
  add_foreign_key "local_armazenamentos", "unidades_socioeducativas"
  add_foreign_key "mapa_de_bordos", "pessoas", column: "motorista_id"
  add_foreign_key "mapa_de_bordos", "pessoas", column: "responsavel_id"
  add_foreign_key "mapa_de_bordos", "veiculos"
  add_foreign_key "materiais", "classe_materiais"
  add_foreign_key "materiais", "local_armazenamentos"
  add_foreign_key "materiais", "unidades_medidas"
  add_foreign_key "material_movimentacoes", "materiais"
  add_foreign_key "material_movimentacoes", "unidades_socioeducativas"
  add_foreign_key "modelos_marcas", "marca_veiculos"
  add_foreign_key "motoristas", "pessoas"
  add_foreign_key "patrimonios", "areas"
  add_foreign_key "patrimonios", "depositos"
  add_foreign_key "patrimonios", "item_patrimonios"
  add_foreign_key "patrimonios", "status_patrimonios"
  add_foreign_key "patrimonios", "unidades_socioeducativas"
  add_foreign_key "pessoas", "usuarios"
  add_foreign_key "recursoshumanos_cargos", "recursoshumanos_contratos", column: "contrato_id"
  add_foreign_key "recursoshumanos_contratos", "recursoshumanos_tipo_legais"
  add_foreign_key "recursoshumanos_contratos", "recursoshumanos_tipo_vinculos"
  add_foreign_key "recursoshumanos_tipo_legais", "recursoshumanos_tipo_vinculos"
  add_foreign_key "recursoshumanos_vinculos", "pessoas", column: "pessoas_id"
  add_foreign_key "recursoshumanos_vinculos", "recursoshumanos_cargos"
  add_foreign_key "servicos", "eixos"
  add_foreign_key "servicos_realizados", "areas"
  add_foreign_key "servicos_realizados", "eixos"
  add_foreign_key "servicos_realizados", "gestores_areas"
  add_foreign_key "servicos_realizados", "gestores_eixos"
  add_foreign_key "servicos_realizados", "gestores_unidades"
  add_foreign_key "servicos_realizados", "servicos"
  add_foreign_key "servicos_realizados", "socioeducandos_atendidos", column: "qtd_socioeducandos_atendidos"
  add_foreign_key "servicos_realizados", "unidades_socioeducativas"
  add_foreign_key "socioeducandos_atendidos", "unidades_socioeducativas"
  add_foreign_key "socioeduk_admissao_anexos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_admissoes", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_admissoes", "unidades_socioeducativas"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_forma_entradas", column: "forma_entrada_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_subforma_entradas", column: "subforma_entrada_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "socioeduk_tipo_desligamentos", column: "tipo_desligamento_id"
  add_foreign_key "socioeduk_atendimento_iniciais", "unidades_socioeducativas"
  add_foreign_key "socioeduk_atendimento_inicial_documentos", "socioeduk_atendimento_iniciais", column: "atendimento_inicial_id"
  add_foreign_key "socioeduk_atendimento_inicial_documentos", "socioeduk_documento_forma_entradas", column: "documento_forma_entrada_id"
  add_foreign_key "socioeduk_contatos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_contatos", "socioeduk_tipo_contatos", column: "tipo_contato_id"
  add_foreign_key "socioeduk_decisao_judiciais", "socioeduk_atendimento_iniciais", column: "atendimento_inicial_id"
  add_foreign_key "socioeduk_deficiencias", "socioeduk_deficiencias", column: "deficiencias_id"
  add_foreign_key "socioeduk_deficiencias", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_documento_forma_entradas", "socioeduk_forma_entradas", column: "forma_entrada_id"
  add_foreign_key "socioeduk_documento_forma_entradas", "socioeduk_subforma_entradas", column: "subforma_entrada_id"
  add_foreign_key "socioeduk_documentos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_endereco_jovens", "cidades"
  add_foreign_key "socioeduk_endereco_jovens", "socioeduk_jovens"
  add_foreign_key "socioeduk_enderecos", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_evasoes", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_infracao_preliminares", "socioeduk_atendimento_iniciais", column: "atendimento_inicial_id"
  add_foreign_key "socioeduk_infracao_preliminares", "socioeduk_tipo_infracoes", column: "tipo_infracao_id"
  add_foreign_key "socioeduk_infracoes", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_infracoes", "socioeduk_tipo_infracoes", column: "tipo_infracao_id"
  add_foreign_key "socioeduk_jovem_caracteristicas", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_caracteristicas", "socioeduk_tipo_sinais"
  add_foreign_key "socioeduk_jovem_contatos", "socioeduk_jovens"
  add_foreign_key "socioeduk_jovem_contatos", "socioeduk_tipo_contatos"
  add_foreign_key "socioeduk_jovens", "socioeduk_cor_olhos", column: "socioeduk_cor_olhos_id"
  add_foreign_key "socioeduk_jovens", "socioeduk_opcao_sexuais", column: "opcao_sexual_id"
  add_foreign_key "socioeduk_jovens", "socioeduk_raca_cores"
  add_foreign_key "socioeduk_jovens", "socioeduk_situacao_adolescentes"
  add_foreign_key "socioeduk_jovens", "socioeduk_tipo_cabelos"
  add_foreign_key "socioeduk_marca_corporais", "socioeduk_jovens", column: "jovem_id"
  add_foreign_key "socioeduk_marca_corporais", "socioeduk_marca_corporais", column: "marca_corporal_id"
  add_foreign_key "socioeduk_subforma_entradas", "socioeduk_forma_entradas", column: "forma_entrada_id"
  add_foreign_key "socioeduk_transferencias", "socioeduk_admissoes", column: "admissao_id"
  add_foreign_key "solicitacao_transportes", "areas"
  add_foreign_key "solicitacao_transportes", "tipo_solicitacao_transportes"
  add_foreign_key "usuarios", "permissoes"
  add_foreign_key "veiculos", "marca_veiculos"
  add_foreign_key "veiculos", "modelos_marcas"
  add_foreign_key "veiculos", "tipo_de_combustiveis"
end
