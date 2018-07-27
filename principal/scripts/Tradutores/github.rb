#!/usr/bin/env ruby
# frozen_string_literal: true

require 'octokit'
require 'rest-client'

client = Octokit::Client.new(access_token: '262e2d66fe75d9e816375e25ee9614490dfe59c3')

user = client.user
user.login

closed_issues = client.issues(owner: 'regismesquita', repo: 'principal', state: 'closed')
number_of_closed_issues = closed_issues.size

payload = { coleta_indicador: {
  indicador_id: '2', # Serviços Sistemas de informação
  area_id: '3', # CGTI
  pessoa_id: '1', # Regis
  indice: number_of_closed_issues.to_s
} }

headers = {
  'X-Usuario-Email': 'regis.mesquita@seas.ce.gov.br',
  'X-Usuario-Token': 'Ud9pGzv6r6h8nMsE7XPE',
  content_type: :json,
  accept: :json
}

# connect to SEAS
puts RestClient.post 'http://erp.seas.ce.gov.br/erp/coleta_indicadores', payload.to_json, headers
puts 'Ok.'
