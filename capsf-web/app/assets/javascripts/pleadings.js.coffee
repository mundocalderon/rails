# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#pleading_date_filed').datepicker
  	dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: "-100:+0"