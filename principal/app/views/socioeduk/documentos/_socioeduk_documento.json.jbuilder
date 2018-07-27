# frozen_string_literal: true

json.extract! socioeduk_documento, :id, :jovem_id, :cpf, :rg_numero, :rg_data_emissao, :rg_orgao_emissor, :rg_uf_emissao, :certidao_nascimento, :certidao_numero, :certidao_pagina, :certidao_livro, :certidao_data_emissao, :certidao_uf_emissao, :cpts_numero, :ctps_serie, :ctps_data_emissao, :ctps_uf_emissao, :titulo_numero, :titulo_serie, :titulo_secao, :pis_numero, :reservista_numero, :deleted_at, :created_at, :updated_at
json.url socioeduk_documento_url(socioeduk_documento, format: :json)
