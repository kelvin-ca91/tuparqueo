$(document).ready(function() {
    // Inicia Google maps
    google.maps.event.addDomListener(window, 'load', initialize);    
    
    $('.btn-alquilar').on('click', function(){
        $.ajax({
            url:'../rentals',
            method: 'POST',
            data: {parkings_id:$('#parkings_id').val(), fechaInicio: $('#fechaInicio').val(), fechaFin: $('#fechaFin').val(), cantDias: $('#cantDias').val(), montoTotal: $('#montoTotal').val(), tiempo: $('.active .tiempo').val()},
            success: function(data){
                $('#myModal .modal-title').text('Felicidades!!');
                $('#myModal .modal-body').html('<div class="text-center"><h2>Gracias por confiar en nosotros</h3><h4>Su alquiler se ha realizado correctamente</h4></div>');
                $('#myModal').modal('show');
                
                setTimeout(function(){
                    $(location).attr('href','https://tuparqueo-kelvinca91.c9users.io/parkings?direccion=&fecha_inicio=&distrito=0');
                },5000);
            }
        });
    });
    
    $('#cantDias').on('keyup', function(){
        var fechaInicio = $('#fechaInicio').val();
        var arrayFecha = fechaInicio.split('-');
        var miFecha = new Date(arrayFecha[0], arrayFecha[1], arrayFecha[2]); 
        miFecha.setTime( miFecha.getTime()+ $(this).val() *24*60*60*1000 );
        $('#fechaFin').val( miFecha.getMonth()+'/'+miFecha.getDate()+'/'+miFecha.getFullYear() );
        $('#montoTotal').val( $('#cantDias').val() * $('#costoDia').html() );
    });
    
    /*var $form = $('#payment-form');
    $form.submit(function(event) {
        event.preventDefault();
        // Disable the submit button to prevent repeated clicks:
        $form.find('.submit').prop('disabled', true);
        
        // Request a token from Stripe:
        //Stripe.card.createToken($form, stripeResponseHandler);
        
        // Prevent the form from being submitted:
        return false;
    });*/
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