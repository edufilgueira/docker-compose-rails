$(document).on 'turbolinks:load', ->
  $(this).on 'change', '#area_id', ->
    url = root_path + 'services'
    if $(this).val() != ''
      url = url + '?area_id=' + $(this).val()
    Turbolinks.visit(url)

  $(this).on 'change', '#event_id', ->
    $.ajax '/services/search_event_topics',
      type: 'GET'
      dataType: 'script'
      data: event_id: $(this).val()

      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
