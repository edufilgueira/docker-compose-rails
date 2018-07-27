$(document).on 'turbolinks:load', ->
  $('#btn-relatorio-indicacores').click  ->
    url = root_path + 'indicadores/relatorio'
    Turbolinks.visit(url + '?ano=' + $('#ano').val() + '&mes=' + $('#mes').val())
