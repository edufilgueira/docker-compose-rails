var ready = function() {

    $("#box_final_vigencia").change(function() {
        if($("#box_final_vigencia").is(":checked"))
        {
            $("#recursoshumanos_contrato_final_vigencia").prop("disabled", false);
            $("#recursoshumanos_contrato_final_vigencia").focus();
        }
        else
            $("#recursoshumanos_contrato_final_vigencia").prop("disabled", true);
    });
    
    verificarCampoDataVigencia();
}

function verificarCampoDataVigencia(){
    if($("#box_final_vigencia").is(":checked"))
    {
        $("#recursoshumanos_contrato_final_vigencia").prop("disabled", false);
        $("#recursoshumanos_contrato_final_vigencia").focus();
    }
    else
        $("#recursoshumanos_contrato_final_vigencia").prop("disabled", true);
}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}