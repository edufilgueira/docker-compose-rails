require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'
#frozen_string_literal: true

Permissao.create!(perfil: 'Admin', recursos: ['administrator|system'])
Pessoa.create!([
 { nome: 'Renoir Sousa', cpf: '98745632100' },
 { nome: 'Elan Teixeira', cpf: '00876321000' },
 { nome: 'Adriel', cpf: '111456312300' },
 { nome: 'Eduardo', cpf: '04778024435' }
])

Usuario.create!([
 { nome: 'Renoir', email: 'renoir.oliveira@seas.ce.gov.br', encrypted_password: '$2a$11$BldjvzEcxBTc8SAomU95w.2L3qvZVayn6RgoVrKxE2zAjoqKjJYju', deleted_at: nil, permissao_id: 1, cargo: 'Administrador do sistema', pessoa: Pessoa.find_by_nome('Renoir Sousa') },
 { nome: 'Elan', email: 'elan@seas.ce.gov.br', encrypted_password: '$2a$11$BldjvzEcxBTc8SAomU95w.2L3qvZVayn6RgoVrKxE2zAjoqKjJYju', deleted_at: nil, permissao_id: 1, cargo: 'Administrador do sistema', pessoa: Pessoa.find_by_nome('Elan Teixeira') },
 { nome: 'Adriel', email: 'adriel@seas.ce.gov.br', encrypted_password: '$2a$11$BldjvzEcxBTc8SAomU95w.2L3qvZVayn6RgoVrKxE2zAjoqKjJYju', deleted_at: nil, permissao_id: 1, cargo: 'Administrador do sistema', pessoa: Pessoa.find_by_nome('Adriel') },
 { nome: 'Eduardo', email: 'eduardo.santos@seas.ce.gov.br', encrypted_password: '$2a$11$BldjvzEcxBTc8SAomU95w.2L3qvZVayn6RgoVrKxE2zAjoqKjJYju', deleted_at: nil, permissao_id: 1, cargo: 'Administrador do sistema', pessoa: Pessoa.find_by_nome('Eduardo') }
])

UnidadeSocioeducativa.create!([
 { nome: 'Centro de Semiliberdade Mártir Francisca', sigla: 'CSMF', endereco: 'Rua Euclides Onofre de Sousa, 1.550 - Sapiranga' },
 { nome: 'Centro Educacional Aldaci Barbosa Mota - Internação', sigla: 'CEABM', endereco: 'Travessa Costa Rica, s/n - Pe. Andrade' },
 { nome: 'Centro Educacional Cardeal Aloísio Lorscheider - Internação', sigla: 'CECAL', endereco: 'Rua Ipaumirim, 830 – Planalto Airton Senna' },
 { nome: 'Centro Educacional Dom Bosco - Internação', sigla: 'CEDB', endereco: 'Rua Eldourado, 1000 -  - Passaré' },
 { nome: 'Centro Educacional Patativa do Assaré - Internação', sigla: 'CEPA', endereco: 'Rua Ten. Jurandir Alencar, 2555 - Ancurí' },
 { nome: 'Centro Educacionao São Francisco - Internação Provisória', sigla: 'CESF', endereco: 'Rua Menor Jerônimo, s/n - Passaré' },
 { nome: 'Centro Educacional São Miguel - Internação Provisória', sigla: 'CESM', endereco: 'Rua Menor Jerônimo s/n - Passaré' },
 { nome: 'Centro Socioeducativo do Canindezinho - Internação', sigla: 'CSC', endereco: 'Rua José Maurício, s/n - Fortaleza - Ceará' },
 { nome: 'Centro Socioeducativo Passaré - Internação Primários', sigla: 'CSP', endereco: 'Rua Eldourado, 800 - Passaré' },
 { nome: 'Unidade de Recepção Luis Barros Montenegro', sigla: 'URLBM', endereco: 'Rua Tabelião Fabião, 114 - P. Kennedy' },
 { nome: 'Central de Vagas', sigla: 'CRV', endereco: 'Rua Tabelião Fabião, 114 - P. Kennedy' },
 { nome: 'Centro de Semiliberdade de Crateús', sigla: 'CSC', endereco: 'Rua Dr. Júlio Lima, 2.251 - Fátima II' },
 { nome: 'Centro de Semiliberdade de Iguatu', sigla: 'CSI', endereco: 'Rua José Caeiras, 270 - Bairro Areias' },
 { nome: 'Centro de Semiliberdade de Juazeiro do Norte', sigla: 'CSJN', endereco: 'Rua Maria Ana Pereira, 925 - Bairro São João' },
 { nome: 'Centro de Semiliberdade de Sobral', sigla: 'CSS', endereco: 'Rua Ministro César Cals, 1.530 - Bairro Terrenos Novos' },
 { nome: 'Centro Socioeducativo Dr. Zequinha Parente - Internação Provisória', sigla: 'CSZP', endereco: 'Rua Ministro Cesar Cals, s/n - Bairro Terrenos Novos' },
 { nome: 'Centro Socioeducativo José Bezerra de Menezes - Internação Provisória', sigla: 'CSJBM', endereco: 'Rua Ladislau de Arruda Campos, s/n – Parque Antônio Vieira' }
])

module BRCidadesEstados
  def self.estados
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
    #file = File.read('estados.json')
    #data_hash = JSON.parse(file)
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    estados.each do |estado|
      region_obj = Regiao.find_or_create_by(:nome => estado["region"])
      state_obj = Estado.new(:acronym => estado["acronym"], :nome => estado["name"], :regiao => region_obj)
      state_obj.save

      estado["cities"].each do |cidade|
        c = Cidade.new
        c.nome = cidade["name"]
        c.estado = state_obj
        c.capital = capital?(cidade, estado)
        c.save
      end
    end
  end
end

BRCidadesEstados.populate