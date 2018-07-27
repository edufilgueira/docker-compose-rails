# frozen_string_literal: true

json.extract! socioeduk_jovem, :id, :nome, :apelido, :falecido, :data_nascimento, :sexo, :opcao_sexual_id, :nome_mae, :nome_pai, :peso, :altura, :dependente_quimico, :nacionalidade, :naturalidade, :etnia, :estado_civil_id, :orfao, :responsavel, :mora_com, :numero_filhos, :responsavel_filhos, :tempo_gestacao, :amamentando, :foto, :created_at, :updated_at
json.url socioeduk_jovem_url(socioeduk_jovem, format: :json)
