$ ->
  $(document).on 'change', '#service_request_area_id', (evt) ->
    $.ajax root_path + 'update_services_by_area',
      type: 'GET'
      dataType: 'script'
      data: {
        area_id: $("#service_request_area_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
