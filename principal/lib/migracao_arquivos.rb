
# frozen_string_literal: true

require 'csv'
csv = CSV.read('./lib/planilha.csv', headers: true)
csv.each do |item|
  # Atribuições
  grupo = item['GRUPO']
  grupo_nome = item['GRUPO MATERIAL/SERVIÇO']
  classe = item['CLASSE']
  classe_nome = item['CLASSE MATERIAL/SERVIÇO']
  tombo_anterior = item["Nº TOMBO\nANTERIOR"]
  origem_anterior = item['ORIGEM anterior']
  tombo_atual = item["Nº TOMBO\nATUAL"]
  origem_atual = item['ORIGEM ATUAL']
  numero_siga = item['SIGA']
  valor = item['VALOR']
  nome  = item['DESCRIÇÃO RESUMIDA']
  descricao = item['DESCRIÇÃO DO MATERIAL ( SISTEMA)']
  quantidade = item['QUANTIDADE']
  situacao = item['SITUAÇÃO']

  # MODIFICAÇÕES
  descricao = "#{quantidade} #{descricao}"

  # CRIAÇÃO
  gp = GrupoPatrimonio.find_or_create_by(codigo: grupo, nome: grupo_nome)
  cp = ClassePatrimonio.find_or_create_by(codigo: classe, nome: classe_nome, grupo_patrimonio_id: gp.id)
  ip = ItemPatrimonio.find_or_create_by!(classe_patrimonio_id: cp.id, nome: nome, descricao: descricao, codigo: numero_siga)
  sp = StatusPatrimonio.find_or_create_by(nome: situacao, descricao: situacao)
  deposito = Deposito.find_or_create_by(nome: :seas)
  begin
    patrimonio_create = Patrimonio.create!(nome: ip.id, classe_patrimonio_id: cp.id, descricao: descricao, tombo_anterior: tombo_anterior, origem_anterior: origem_anterior, origem_atual: origem_atual, tombo_atual: tombo_atual, status_patrimonio_id: sp.id, deposito_id: deposito.id, valor: valor, numero_siga: numero_siga, nota_fiscal: '')
  rescue Exception => e
    puts "\n\n\a" + e.inspect + ":\n" + { nome: ip.id, classe_patrimonio_id: cp.id, descricao: descricao, tombo_anterior: tombo_anterior, origem_anterior: origem_anterior, origem_atual: origem_atual, tombo_atual: tombo_atual, status_patrimonio_id: sp.id, deposito_id: deposito.id, valor: valor, numero_siga: numero_siga, nota_fiscal: '' }.inspect + "\n\n"
  end
end
