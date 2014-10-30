(function($) {
  var userLat, userLon, zoom_amt;
  $(document).ready(function () {

    google.maps.event.addDomListener(window, 'load', initialize);
  });

  function initialize() {
    // if (user_location) {
    //   var mapOptions = { center: user_location };
    // } else {
    //   window.location('/trip/new');
    // }
    if (typeof userLat  == 'undefined') { userLat  = 39.7392; }
    if (typeof userLon  == 'undefined') { userLon  = -104.9847; }
    if (typeof zoom_amt == 'undefined') { zoom_amt = 12 }
    // console.log( userLat, userLon, zoom_amt );

    var mapOptions = {
      center: { lat: userLat, lng: userLon },
      zoom: zoom_amt
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
    var allMarkers = [],
        bounds = new google.maps.LatLngBounds(),
        infowindow = new google.maps.InfoWindow(),
        marker;
    for (i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
        identifier: locations[i][3],
        content: '<p><strong>'+locations[i][0]+'</strong></p><p>' +
                 '<a href="https://www.google.com/maps/dir/'+userLat+','+userLon+'/'+locations[i][0]+'" target="_blank">Get Directions</a></p>'
      });

      bounds.extend(marker.position);
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(marker.content);
          infowindow.open(map, marker);
        }
      })(marker, i));
      allMarkers.push(marker);
    }
  }

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var LatLngvar=new google.maps.LatLng(position.coords.latitude, position.coords.longitude, true);
      $('#starting_location_latitude').val(position.coords.latitude);
      $('#starting_location_longitude').val(position.coords.longitude);
      $('#starting_location_address').hide().after('<p>Using your current location</p>');
      userLat  = position.coords.latitude;
      userLon  = position.coords.longitude;
      zoom_amt = 16;
      initialize();
    }, function(error) {
      //alert( JSON.stringify(error) );
    }, { enableHighAccuracy: true, maximumAge: 30000, timeout: 27000 });
  } else {
    //alert("No browser geolocation allowed!");
  }
})(jQuery);
