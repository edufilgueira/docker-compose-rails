$ ->
  $(document).on 'change', '#servico_realizado_mes, #servico_realizado_unidade_socioeducativa_id', (evt) ->
    ajax_filtro()
  $(document).on 'focusout', '#servico_realizado_ano', (evt) ->
    ajax_filtro()

  ajax_filtro = ->
    unidade = $("#servico_realizado_unidade_socioeducativa_id option:selected").val()
    mes = $("#servico_realizado_mes option:selected").val()
    ano = $("#servico_realizado_ano").val()
    if ano != '' && unidade != '' && mes != ''
      $.ajax root_path + 'socioeducandos_atendidos/filter/' + unidade + '/' + ano + '/' + mes,
        type: 'GET'
        dataType: 'script'
    return
