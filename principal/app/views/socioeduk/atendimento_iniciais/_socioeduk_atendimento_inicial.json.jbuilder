# frozen_string_literal: true

json.extract! socioeduk_atendimento_inicial, :id, :jovem_id, :unidade_socioeducativa_id, :entrada_em, :reincidente, :cumpre_medida, :qual_medida, :cidade_infracao, :bairro_infracao, :busca_apreensao, :cidade_origem_processo, :cidade_execucao_processo, :numero_oficio_bo, :comarca_origem, :procedencia, :numero_processo, :guia_corpo_delito, :alcoolizado, :drogado, :ematomas, :agressor, :observacoes, :nome_condutor, :funcao_condutor, :rg_condutor, :encaminhado, :encaminhado_em, :tipo_desligamento_id, :desligado_em, :deleted_at, :created_at, :updated_at
json.url socioeduk_atendimento_inicial_url(socioeduk_atendimento_inicial, format: :json)
