// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require clockpicker/clockpicker.js
//= require maskmoney/mask-money.js
//= require metisMenu/jquery.metisMenu.js
//= require bootstrap-sprockets
//= require pace/pace.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require jquery_ujs
//= require moment
//= require select2
//= require Chart.bundle
//= require chartkick
//= require select2-full
//= require toastr/toastr.min.js
//= require turbolinks
//= require autocomplete_zipcode
//= require nested_form_fields
//= require_tree .
//= require bootstrap-modal

var ready = function() {
  $('[data-tooltip="true"]').tooltip();

  $('.sidebar-toggle').click(function() {
    setTimeout(function() {
      hasKlass = $('body').hasClass('sidebar-collapse')
      $.get(root_path + 'sidebar_preference?sidebar_preference=' + hasKlass)
    }, 300);
  })
  $(".select2").select2({
    theme: "bootstrap"
  });
  $( ".select2tags" ).select2({
    theme: "bootstrap",
    tags: true
  })

  recarreca_campos()

  $('[type="submit"], a[data-method="post"]').click(function() {
    $('#box-loading').children('.box-loading-content').toggleClass('sk-loading');
  });

  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    todayBtn: "linked",
    clearBtn: true,
    language: "pt-BR",
    autoclose: true,
    todayHighlight: true
  });

  $('.clockpicker').clockpicker({
    placement: 'top',
    align: 'left',
    donetext: 'Ok'
  });

  document.addEventListener('zipcode.error', function(e) {
    alert('Cep invalido!!!')
  });

  $('.currency').maskMoney({
    prefix: 'R$ ',
    allowNegative: true,
    thousands: '',
    decimal: '.',
    affixesStay: false
  });

  $('.maskcpf').mask('000.000.000-00', {reverse: true});

}

function recarreca_campos() {
  if ($("#servico_realizado_eixo_id option:selected").val() != "")
    $('#servico_realizado_eixo_id').trigger('change');
  if ($("#servico_realizado_area_id option:selected").val() != "")
    $('#servico_realizado_area_id').trigger('change');
  if ($("#servico_realizado_unidade_socioeducativa_id option:selected").val() != "")
    $('#servico_realizado_unidade_socioeducativa_id').trigger('change');
  if ($("#servico_realizado_mes option:selected").val() != "")
    $('#servico_realizado_mes').trigger('change');
}

$(document).on('turbolinks:request-start',  function() {  $('#box-loading').children('.box-loading-content').toggleClass('sk-loading'); });
$(document).on('turbolins:request-end', function() { $('#box-loading').children('.box-loading-content').toggleClass('sk-loading'); });

$(document).on('turbolinks:render', function() {
  if ($('.box-loading-content').hasClass('sk-loading')) {
    $('#box-loading').children('.box-loading-content').toggleClass('sk-loading');
  }
});

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}

function validaCPF(cpf) 
{
        cpf = cpf.replace('.','');
        cpf = cpf.replace('.','');
        cpf = cpf.replace('-','');
         
        erro = new String;
        if (cpf.length < 11) erro += "Sao necessarios 11 digitos para verificacao do CPF! \n\n"; 
        var nonNumbers = /\D/;
        if (nonNumbers.test(cpf)) erro += "A verificacao de CPF suporta apenas numeros! \n\n";  
        if (cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999"){
              erro += "Numero de CPF invalido!"
        }
        var a = [];
        var b = new Number;
        var c = 11;
        for (i=0; i<11; i++){
            a[i] = cpf.charAt(i);
            if (i <  9) b += (a[i] *  --c);
        }
        if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
        b = 0;
        c = 11;
        for (y=0; y<10; y++) b += (a[y] *  c--); 
        if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }
        status = a[9] + ""+ a[10]
        if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10])){
            erro +="Digito verificador com problema!";
        }
        if (erro.length > 0){
            return false;
        }
        return true;
}

function validaEmail(email) {
  var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
  return regex.test(email);
}