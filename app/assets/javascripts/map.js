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
    var car2GoMarkers = [],
        bounds = new google.maps.LatLngBounds(),
        infowindow = new google.maps.InfoWindow(),
        marker;
    for (i = 0; i < locations.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
        icon: 'assets/car2go_icon_2.png',
        identifier: locations[i][3],
        content: '<p><strong>'+locations[i][0]+'</strong></p><p>'+
                 'interior: '+locations[i][4]+'  |  exterior: ' +locations[i][5]+'</p><p>'+
                 'fuel: '+locations[i][6]+'% full</p><p>'+
                 '<a href="https://www.google.com/maps/dir/'+userLat+','+userLon+'/'+locations[i][0]+
                 '" target="_blank" class="button [tiny small large]">Get Directions</a></p>'
      });

      bounds.extend(marker.position);
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(marker.content);
          infowindow.open(map, marker);
        }
      })(marker, i));
      car2GoMarkers.push(marker);
    }

    userMarker = new google.maps.Marker({
      position: new google.maps.LatLng(userLat, userLon),
      map: map,
      icon: 'assets/user_start_icon.png',
      flat: true,
      title: 'MY LOCATION',
    });

    destinationMarker = new google.maps.Marker({
      position: new google.maps.LatLng(destAddLat, destAddLon),
      map: map,
      title: 'MY DESTINATION',
      content: '<p><strong>DESTINATION</strong></p>'+'<p>X miles away</p>'
    });

    var bCycleMarkers = [],
        bounds = new google.maps.LatLngBounds(),
        infowindow = new google.maps.InfoWindow(),
        bCycleMarker;
    for (i = 0; i < bCycles.length; i++) {
      bCycleMarker = new google.maps.Marker({
        position: new google.maps.LatLng(bCycles[i][2], bCycles[i][3]),
        map: map,
        icon: 'assets/b_cycle_icon_48.png',
        identifier: bCycles[i][0],
        content: '<p><strong>'+bCycles[i][0]+'</strong></p><p>'
                 +bCycles[i][1]+' bike docks</p><p>'+
                 '<a href="https://www.google.com/maps/dir/'+userLat+','+userLon+'/'+bCycles[i][4]+
                 '" target="_blank" class="button [tiny small large]">Get Directions</a></p>'
      });

      bounds.extend(bCycleMarker.position);
      google.maps.event.addListener(bCycleMarker, 'click', (function(bCycleMarker, i) {
        return function() {
          infowindow.setContent(bCycleMarker.content);
          infowindow.open(map, bCycleMarker);
        }
      })(bCycleMarker, i));
      bCycleMarkers.push(bCycleMarker);
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
