$(document).ready(function() {
    // Inicia Google maps
    google.maps.event.addDomListener(window, 'load', initialize);    
    
    $('.btn-alquilar').on('click', function(){
        $.ajax({
            url:'../rentals',
            method: 'POST',
            data: {parkings_id:$('#parkings_id').val()},
            success: function(data){
                $('#myModal .modal-title').text('Felicidades!!');
                $('#myModal .modal-body').html('<div class="text-center"><h2>Gracias por confiar en nosotros</h3><h4>Su alquiler se ha realizado correctamente</h4></div>');
                $('#myModal').modal('show');
            }
        })    
    });
});

var initialize = function(){
    var latitud = $('#latitud').val();
    var longitud = $('#longitud').val();
    var mapOptions = {
        zoom : 15,
        center : new google.maps.LatLng(latitud, longitud)
    }
    
    var infoWindow = new google.maps.InfoWindow();
    var map = new google.maps.Map(document.getElementById('div-mapa'), mapOptions);
    
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(latitud, longitud),
        map: map
    });

}