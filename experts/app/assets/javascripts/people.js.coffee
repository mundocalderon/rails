# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
$('#person_date_of_birth').datepicker
    dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: "-100:+0"

$('#person_date_of_death').datepicker
    dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: "-100:+0"

	#taken from ryanb/nested_form and JS2COFFEE.org
$(document).on "nested:fieldAdded", (event) ->
	field = event.field
	dateField = field.find(".date")
	dateField.datepicker( dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: "-20:+0" )


$('form').on 'click', '.remove_ransack_fields', (event) ->
	$(this).closest('.field').remove()
	event.preventDefault()

$('form').on 'click', '.add_ransack_fields', (event) ->
	 time = new Date().getTime()
	 regexp = new RegExp($(this).data('id'), 'g')
	 $(this).before($(this).data('fields').replace(regexp, time))
	 event.preventDefault()