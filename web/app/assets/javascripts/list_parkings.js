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
    var latitud = $.trim( $('#lat_centro').val() );
    var longitud = $.trim( $('#lon_centro').val() );
    var zoom = ($.trim($('#district_id').val())>0)? 15:12;
    console.log(zoom);
    var mapOptions = {
        zoom : zoom,
        center : new google.maps.LatLng(latitud, longitud)
    }
    
    var infoWindow = new google.maps.InfoWindow();
    var map = new google.maps.Map(document.getElementById('div-mapa'), mapOptions);
    
    $('#list-search .col-principal').each(function(index, el){
      var $this = $(this);
      var latitud = ( $this.find('.latitud').val() );
      var longitud = ( $this.find('.longitud').val() );
      
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(latitud, longitud),
        map: map
      });
      
      google.maps.event.addListener(marker, 'click', function (e) {
        infoWindow.setContent($this.find('.titulo').html()+'<br>'+$this.find('.direccion').html());
        infoWindow.open(map, marker);
        $('#list-search .col-principal').removeClass('active');
        $this.addClass('active');
      });  
    })
    
    
    

    // var latitud = -12.096870;
    // var longitud = -77.001359;
    
    // var marker2 = new google.maps.Marker({
    //     position: new google.maps.LatLng(latitud, longitud),
    //     map: map
    // });

    // google.maps.event.addListener(marker2, 'click', function (e) {
    //     infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
    //     infoWindow.open(map, marker2);
    // });
    
    
    // var latitud = -12.098781;
    // var longitud = -76.999979;
    
    // var marker3 = new google.maps.Marker({
    //     position: new google.maps.LatLng(latitud, longitud),
    //     map: map
    // });

    // google.maps.event.addListener(marker3, 'click', function (e) {
    //     infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
    //     infoWindow.open(map, marker3);
    // });
    
    
    // var latitud = -12.095802;
    // var longitud =  -76.995439;
    
    // var marker4 = new google.maps.Marker({
    //     position: new google.maps.LatLng(latitud, longitud),
    //     map: map
    // });

    // google.maps.event.addListener(marker4, 'click', function (e) {
    //     infoWindow.setContent('Titulo de estacionamiento<br>Dirección del estacionamiento');
    //     infoWindow.open(map, marker4);
    // });
}