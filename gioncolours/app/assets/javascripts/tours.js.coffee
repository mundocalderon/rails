$(document).ready ->
	$("#tour_date_begin").datepicker()
	$("#tour_date_end").datepicker()

	$(document).on "nested:fieldAdded", (event) ->
		field = event.field
		dateField = field.find(".date")
		dateField.datepicker()