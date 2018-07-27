var ready = function() {
    $( document ).ready(function() {
        $('#justificativa-urgencia').hide();
        $('#solicitacao_transporte_urgente').click(function() {
            if(this.checked) {
                $('#justificativa-urgencia').show();
            } else {
                $('#justificativa-urgencia').hide();
            }
        })
    })
}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}