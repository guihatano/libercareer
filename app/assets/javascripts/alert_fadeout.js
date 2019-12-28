$(document).ready(function() {
  if ($(".alert").length > 0) {
    $(".alert").fadeTo(4000, 0).slideUp(500, function(){
        $(this).remove();
    });
  }
});