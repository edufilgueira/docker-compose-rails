class EnviarEmailMailer < ApplicationMailer
    default from: 'assitente.virtual@seas.ce.gov.br'

    def solicitar_transporte(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Solicitação de Transporte')
    end

    def autorizar_transporte(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Solicitação de Transporte Autorizada')
    end      
    
    def cancelar_transporte(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Solicitação de Transporte Cancelada')
    end     
    
    def gerar_mapa_bordo(dados)
        @email = dados[:email]
        @solicitacao = dados[:solicitacao]
        mail(from: 'transporte@seas.ce.gov.br', to: @email, subject: 'Mapa de bordo')
    end    

end
