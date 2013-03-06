// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-alert
//= require bootstrap-button
//= require bootstrap-dropdown
//= require bootstrap-tooltip
//= require bootstrap-transition
//= require bootstrap-modalmanager
//= require bootstrap-modalfix
//= require rails.validations
//= require rails.validations.simple_form
//= require_tree .

$(document).ready(function(){
	$(".tt").tooltip();
	$('.modal').addClass('hide fade'); // fucking stupid bug fix for client_side_validations that cost me 2 hours of my life =/
	
	var new_modal_button_left = " <button type='button' class='btn btn-mini btn-success' data-toggle='modal' data-target='";
	var new_modal_button_right = "'><i class='icon-plus icon-white'></i> ADD</button>";
	
	$('.client_id_ajax').after(new_modal_button_left + "#new_client_modal" + new_modal_button_right);
	$('.url_id_ajax').after(new_modal_button_left + "#new_url_modal" + new_modal_button_right);
	$('.keyphrase_id_ajax').after(new_modal_button_left + "#new_keyphrase_modal" + new_modal_button_right);
});