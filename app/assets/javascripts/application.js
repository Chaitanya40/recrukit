// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require_tree
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require inspinia.js
//= require underscore_min/underscore-min.js
//= require toastr/toastr.min.js
//= require jquery-ui.min.js
//= require scaffold






//= require iCheck/icheck.min.js
//= require colorpicker/bootstrap-colorpicker.min.js
//= require cropper/cropper.min.js
//= require datapicker/bootstrap-datepicker.js
//= require switchery/switchery.js
//= require chosen/chosen.jquery.js
//= require jasny/jasny-bootstrap.min.js

toastr.options = {
  "closeButton": true,
  "debug": false,
  "progressBar": true,
  "positionClass": "toast-top-right",
  "onclick": null,
  "showDuration": "400",
  "hideDuration": "1000",
  "timeOut": "7000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}

function show_toastr(toastr_message){
  toastr.info("", toastr_message);
}
