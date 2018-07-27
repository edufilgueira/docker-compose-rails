var ready = function() {

$(function()
{
    //Executa a requisição quando o campo username perder o foco
    $('#pessoa_cpf').blur(function()
    {
        var cpf = $('#pessoa_cpf').val();
        if(validaCPF(cpf))
            $('#val_cpf').html('');
        else
        {
            $('#val_cpf').html('CPF inválido');            
            $('#pessoa_cpf').focus();    
        }
    });

    //Executa a requisição quando o campo username perder o foco
    $('#pessoa_email_pessoal').blur(function()
    {
        var cpf = $('#pessoa_email_pessoal').val();
        if(validaEmail(cpf))
            $('#val_email_pessoal').html('');
        else
            $('#val_email_pessoal').html('e-mail inválido');
    });

});

}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}