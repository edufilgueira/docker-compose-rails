var ready = function() {
	$( document ).ready(function() {
		if ($("#patrimonio_tombo_anterior").val() != '' && $("#patrimonio_origem_anterior").val() != '') {
			$('#origem').show();
			$('#origem_anterior_bem').prop('checked', true);
		} else {
			$('#origem').hide();
			$('#origem_anterior_bem').prop('checked', false);
		}

		$('#origem_anterior_bem').click(function() {
			if(this.checked) {
				$('#origem').show();
			} else {
				$('#origem').hide();
			}
		})
	})

	var localizacao_bem = $('#localizacao_bem').val();
	if (localizacao_bem == "Área") {
		$('#deposito').hide();
		$('#area').show();
	} else if (localizacao_bem == "Depósito") {
		$('#area').hide();
		$('#deposito').show();
	} else {
		$('#deposito').hide();
		$('#area').hide();
	}
	
	$('#localizacao_bem').change(function () {
		var localizacao_bem = $('#localizacao_bem').val();
		if (localizacao_bem == "Área") {
			$('#deposito').hide();
			$('#area').show();
		} else if (localizacao_bem == "Depósito") {
			$('#area').hide();
			$('#deposito').show();
		}
	})
}

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}