// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.facebox
//= require_tree 
//
//$(document).ready(function() {
//		setTimeout(hideFlashMessages, 10000);
//	});
//
//	function hideFlashMessages() {
//		$('div#flash_notice, div#flash_warning, div#flash_error').fadeOut(5000)
//	}
//
//	$(function(){
//		$('#flash_notice').delay(500).fadeIn('normal',function() {
//		$(this).delay(2500).fadeOut();
//		});
//	});

/* show user status message */
function status_update(status) {
	/* convert status to array */
	if(!(status instanceof Array)) { status = [status]; }
	jQuery('body').showMessage({
			'thisMessage':			status,
			'className':			'success',
			'opacity':			90,
			'displayNavigation':		true,
			'autoClose':			true,
			'delayTime':			9000
	});
}

jQuery(function (){
	$(".box-01-top-b").click(function(){
		toggleSlide(this);
	});
});

function toggleSlide(element){
	var drawer = jQuery(".box-01-top-b box");
	var content= jQuery(".box-01");
	if (jQuery(content).is(":hidden")){
		setTimeout(function(){
				jQuery(content).effect("slide", {direction: "up", mode : "show"}, 500);
		},1);
		setTimeout(function(){
			jQuery(drawer).effect("blind", {direction: "vertical", mode : "show" }, 500);
		},1);
	}
	else{
		setTimeout(function(){
			jQuery(drawer).effect("blind", { direction: "vertical", mode : "hide" }, 500);
			//the previous blind effect will hide the drawer
			//however we want it to be shown again, if not the next iteration wont play
			jQuery(drawer).effect("blind", { direction: "vertical", mode : "show" }, 1);
		},1);
		setTimeout(function(){
			jQuery(content).effect("slide", { direction: "up", mode : "hide" }, 500);
		}, 1);
	}
}

