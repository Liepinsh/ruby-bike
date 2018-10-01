
$(document).ready(function() {
    setInterval(function(){
        $.ajax({
            url: "/reservations/reservation_ajax"
        }).done(function(reservations) {
            for(let reservation of reservations) {
                let $reservationElement = $('[data-reservation-id="' + reservation.id + '"]');
                $reservationElement.find('[data-reservation-attribute="starting"]').text(reservation.starting.strftime("%H:%M %Y.%m.%e"));
                $reservationElement.find('[data-reservation-attribute="till"]').text(reservation.till.strftime("%H:%M %Y.%m.%e"));
                $reservationElement.find('[data-reservation-attribute="employee_full_name"]').text(reservation.employee.full_name);
                $reservationElement.find('[data-reservation-attribute="bike_name"]').text(reservation.bike.name);
            }
        });
    }, 3000);
});