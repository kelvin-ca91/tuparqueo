$(document).ready(function() {
  // Inicia Google maps
  google.maps.event.addDomListener(window, 'load', initialize);    
  
  // Evento cuando se agrega o desagrega de favoritos
  $('.icon-favorite').on('click', function(){
    var $this = $(this);
    if( $this.hasClass('fa-heart-o') ){
      
      $this.removeClass('fa-heart-o').addClass('fa-heart');
      $.ajax({
        url: '../favorites',
        method: 'POST',
        data: {parkingId: $this.attr('data-id'), userId: $('#userId').html() },
        success:function(data){
          $this.attr('data-favorite-id', data);
        }
      });
    }else{
      $this.removeClass('fa-heart').addClass('fa-heart-o');
      $.ajax({
        url: '../favorites/1',
        method: 'DELETE',
        data: {parkingId: $this.attr('data-id'), userId: $('#userId').html() },
        success:function(){
          console.log('Its okaay :D');
        }
      });
    }
  });
});

var initialize = function(){
    var latitud = -12.0954344;
    var longitud = -76.9989324;
    var mapOptions = {
        zoom : 15,
        center : new google.maps.LatLng(latitud, longitud),
        panControl: false,
        zoomControl: true,
        mapTypeControl: false,
        scaleControl: true,
        streetViewControl: false,
        overviewMapControl: false,
        scrollwheel: false
    }
    //var styles =[];
    
    var styles = [
        {
            stylers: [
                { hue: "#00ffe6" },
                { saturation: -20 }
            ]
        },{
            featureType: "road",
            elementType: "geometry",
            stylers: [
                { lightness: 100 },
                { visibility: "simplified" }
            ]
        },{
            featureType: "road",
            elementType: "labels",
            stylers: [
                { visibility: "true" }
            ]
        }
    ];
    
    var infoWindow = new google.maps.InfoWindow();
    var map = new google.maps.Map(document.getElementById('div-mapa'), mapOptions);
    map.setOptions({styles: styles});
    
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(latitud, longitud),
        map: map
    });

    google.maps.event.addListener(marker, 'click', function (e) {
        infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
        infoWindow.open(map, marker);
    });
    

    var latitud = -12.096870;
    var longitud = -77.001359;
    
    var marker2 = new google.maps.Marker({
        position: new google.maps.LatLng(latitud, longitud),
        map: map
    });

    google.maps.event.addListener(marker2, 'click', function (e) {
        infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
        infoWindow.open(map, marker2);
    });
    
    
    var latitud = -12.098781;
    var longitud = -76.999979;
    
    var marker3 = new google.maps.Marker({
        position: new google.maps.LatLng(latitud, longitud),
        map: map
    });

    google.maps.event.addListener(marker3, 'click', function (e) {
        infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
        infoWindow.open(map, marker3);
    });
    
    
    var latitud = -12.095802;
    var longitud =  -76.995439;
    
    var marker4 = new google.maps.Marker({
        position: new google.maps.LatLng(latitud, longitud),
        map: map
    });

    google.maps.event.addListener(marker4, 'click', function (e) {
        infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
        infoWindow.open(map, marker4);
    });
}