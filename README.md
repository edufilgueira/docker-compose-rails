# Dockerfile container

O objetivo deste projeto é levantar vários containers para os sistemas, e como boa pratica será levantado containers para o banco postgres, servidor tomcat com java SDK e servidor ruby on rails.

Esta aplicação foi desenvolvida em java Restfull API e tem como objetivo realizar o cadastro de pessoas de acordo com as especificações do teste enviado, usando as melhores praticas de desenvolvimentos no mercado, observando a estrutura de código legível e realização testes unitários.

**Containers docker necessários**
* Servidor nginx [AngularJS]
* OpenJDK [JAVA]
* Ruby2.4 [Rails]
* Banco de Dados [Postgres9.4]

![diagrama](https://user-images.githubusercontent.com/37155369/39548715-cfba5aa2-4e31-11e8-9bd3-e4a5d3fbe9ef.jpg)

# Serviços implementados
Como a funcionalidade deste teste é construir uma api que fornece serviços para um cliente, desenvolvi uma visão com angular que consome a api via ajax, tendo em vista que o rails é uma plataforma bastante robusta para ser apenas uma consumidora de serviços.

### AngularJS
Desenvolvi uma visão com angularJs para apresentar a qualidade do código e a facilidade em desenvolver interface usando esta ferramenta. Esta camada está consumindo os serviços da API.

### Rails
O projeto rails não esta consumindo os serviços da API, pois não faz sentido criar toda a estrutura do framework para, apenas, consumir serviços de uma api, pois o html e javascrip faz isso muito bem, por isso a decisão de criar uma visão com AngularJs.

### API Engine
A Api foi desenvolvida em java e sua função é manter o cadastro de pessoas. Sua implementação foi feita com Spring Boot dando maior produtividade aos trabalhos realizados. Escolhi as ferramentas da Spring por estar familiarizado com o seu conceito e pela facilidade no desenvolvimento.

# Instalação

Entre com o _terminal_ no diretório que achar mais coveniente para executar a aplicação pelo docker-compose. Após a finalização desse passo a passo toda a aplicação estará pronta para uso.

**1. Execute os comando para rodar as aplicações na pasta 'projeto'**

```
docker-compose build
docker-compose up -d
```

Por se tratar de uma aplicação um pouco mais complexa é necessário criar manualmente o database da API java e rodar os migrates do rails. No caso do java ainda não consegui configurar para que ele crie o database automaticamente.

**2. Criar um database 'pessoas' para a api java**
```
docker exec -it projeto_db_1 psql -U postgres
CREATE DATABASE pessoas;
\q
```
**3. Rodar o migrate rails**
```
docker-compose run rails bundle exec rails db:create
docker-compose run rails bundle exec rails g scaffold User nome:string email:string
docker-compose run rails bundle exec rails db:migrate
```

**4. Verificar se a api java foi levantada executando o comando de log do container da api**


Primeiro derrube e levante a aplicação para atualizar o database criado no passo **2**.

```
docker-compose down
docker-compose up -d
```

Comando do log
```
docker container logs -f projeto_api_1 
```

### Links de acesso
* [AngularJS - http://localhost](http://localhost) 
* [Rails - http://localhost:3000](http://localhost:3000) 
* [API - http://localhost:8086/metodos](http://localhost:8086/metodos) 
