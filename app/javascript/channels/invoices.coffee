jQuery ->
  $('#invoice_client_name').autocomplete
    source: JSON.parse($('#invoice_client_name').data('autocomplete-source'))
