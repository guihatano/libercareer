$(document).ready(function() {
  if (($("#new_rental").length > 0) || ($("#edit_rental").length > 0)) {
    $("#rental_vehicle_id").on('change', function (e) {
      console.log($("#rental_vehicle_id").val())
      calculateRentalValue();
    })

    $("#rental_start_date").on('change', function (e) {
      console.log($("#rental_start_date").val())
      calculateRentalValue();
    })

    $("#rental_end_date").on('change', function (e) {
      console.log($("#rental_end_date").val())
      calculateRentalValue();
    })
  }

  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
});

function calculateRentalValue() {
  if (($("#rental_vehicle_id").val() !== "") &&
       ($("#rental_start_date").val() !== "") &&
       ($("#rental_end_date").val() !== "")) {
    
    $.ajax({
      url: '/admin/rentals/new/calculate-rental',
      method: 'POST',
      data: {
        rental: {
          vehicle_id: $("#rental_vehicle_id").val(),
          start_date: $("#rental_start_date").val(),
          end_date: $("#rental_end_date").val()
        }
      }
    }).done(function(response) {
      setValue(response.value)
    });
  }
}

function setValue(value) {
  $("#rental_value").val(value)
}