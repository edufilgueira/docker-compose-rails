# frozen_string_literal: true

class ServiceMailer < ApplicationMailer
  default from: 'no-reply@seas.ce.gov.br'

  def notifier(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

  def services_requesteds(services)
    @services = services
    mail(to: 'daniel.oliveira@seas.ce.gov.br', subject: "Serviços solicitados (#{(Date.current - 1.day).strftime('%d/%m/%y')})")
  end
end
