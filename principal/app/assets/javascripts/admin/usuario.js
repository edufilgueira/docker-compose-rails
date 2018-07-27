var ready = function() {
    $('#pesquisar').click(function() {
      var cpf = $('#cpf').val();
      
      $.ajax({
        url: '/admin/usuarios/buscar_usuario_cpf',
        type: "get",
        dataType : "html",
        data: { cpf: cpf }
       }).done(function(retorno) {
          var dados  = JSON.parse(retorno);
          if(retorno != 'null')
          {
            $("#usuario_pessoa_id").val(dados.id).change();
            msg = 'USUÁRIO <b>' + dados.nome + '</b> ENCONTRADO';
          }
          else
          {
            $("#usuario_pessoa_id").val('').change();
            msg = 'Nenhuma pessoa encontrada';
          }

          $("#resultado").html(msg);
       });
    }); 
}

if (typeof Turbolinks == "undefined") {
    $(document).ready(ready);
} else {
    $(document).on("turbolinks:load", ready);
}