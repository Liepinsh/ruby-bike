
$(document).ready(function() {
    setInterval(function(){
        $.ajax({
            url: "/bikes/bike_ajax"
        }).done(function(bikes) {
            for(let bike of bikes) {
                let $bikeElement = $('[data-bike-id="' + bike.id + '"]');
                $bikeElement.find('[data-bike-attribute="name"]').text(bike.name);
            }
        });
    }, 3000);
});