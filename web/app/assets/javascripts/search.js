$(document).ready(function() {
    // Inicia Google maps
    google.maps.event.addDomListener(window, 'load', initialize);    
});

var initialize = function(){
    var latitud = -12.0954344;
    var longitud = -76.9989324;
    var mapOptions = {
        zoom : 17,
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
        infoWindow.setContent('Likecom.pe');
        infoWindow.open(map, marker);
    });
}