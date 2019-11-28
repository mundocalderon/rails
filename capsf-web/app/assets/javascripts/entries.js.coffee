jQuery ->
	$("#entry_category_ids").select2
		placeholder: "Select Categories"
		
	$("#entry_subcategory_ids").select2
		placeholder: "Select Subcategories"
		
	$("#entry_entry_type_id").select2
		placeholder: "Select Entry Type"
	
	$('#entry_tags').tokenInput '/entries/tags.json',
		prePopulate: $("#entry_tags").data("load")
		preventDuplicates: true
		noResultsText: 'No results, enter a " space " to create a new tag.'
		placeholder: 'Tag List ...'
		theme: 'bootstrap'
	
  $('#entry_document_date').datepicker
    dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true, yearRange: "-100:+0"
	
