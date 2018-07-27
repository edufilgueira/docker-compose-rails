class Motorista < ApplicationRecord
    belongs_to :pessoa

    def self.motoristas
        funcao = Funcao.find_by_nome('Motorista').id
        FuncaoPessoa.joins(:pessoa).where(funcao_id: funcao).select('pessoas.id', 'pessoas.nome')
    end
    
end
