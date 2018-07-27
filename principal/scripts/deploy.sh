#!/bin/bash
echo -n "$(date -R): "
cd /root/principal/
https_proxy=http://172.26.2.31:80 git fetch
if [ $(git rev-parse HEAD) == $(git rev-parse @{u}) ] ; then
  echo "Update nao necessario"
else
  echo "Update Necessário"
  # Cicla entre as portas 3000 e 3001
  CURRENT_PORT=`docker inspect seas_principal3000 | grep \"Ports\" -n1 | grep tcp | cut -f1 -d\/ | cut -f2 -d\"`
  if [ "$CURRENT_PORT" == "3000" ]; then
    NEWPORT=3001
  else
    CURRENT_PORT=3001
    NEWPORT=3000
  fi

  #Atualiza o repositório
  https_proxy=http://172.26.2.31:80 git pull origin master
  #Cria o docker
  https_proxy=http://172.26.2.31:80 docker build -t principal_deploy .

  #Determina nome dos novos containers
  APPNAME=seas_principal$NEWPORT
  NGINXNAME=nginx$NEWPORT


  #cria um novo container rails , executa as ações necessarias
  docker run --name $APPNAME --publish $NEWPORT:$NEWPORT -v /srv/docker/database-principal.yml:/usr/src/app/config/database.yml -d -v /srv/docker/production.rb:/usr/src/config/environments/production.rb -v /srv/docker/system/:/usr/src/public/system/ --env RAILS_RELATIVE_URL_ROOT="/erp" --link my-memcache:memcached principal_deploy && docker exec $APPNAME rake db:migrate && docker exec $APPNAME rake assets:precompile

  #derruba o nginx anterior e levanta um novo na mesma porta porem apontando para o novo container rails
  docker stop nginx$CURRENT_PORT && docker rm nginx$CURRENT_PORT
  https_proxy=http://172.26.2.31:80 docker run --name $NGINXNAME -v /var/nginx/conf:/etc/nginx:ro --link $APPNAME:principal -p 80:80 -d nginx

  #remove o container rails anterior
  docker stop seas_principal$CURRENT_PORT && docker rm seas_principal$CURRENT_PORT

  #FIXIT: remover container antigo apenas no momento de levantar um novo usnado como referencia o utilizado atualmente pelo nginx de forma que em caso de catastrofe um rollback seja facilitado.
fi
