//= require rails-ujs
//= require_tree .
  $("input.datepicker").each(function(input) {
     $(this).datepicker({
     dateFormat: "yy-mm-dd",
     altField: $(this).next()
      })
