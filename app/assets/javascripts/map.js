$(document).ready(function () {
    function initialize() {
      // if (user_location) {
      //   var mapOptions = { center: user_location };
      // } else {
      //   window.location('/trip/new');
      // }
      var mapOptions = {
        center: { lat: 39.7496354, lng: -105.0001058},
        zoom: 16
      };
      var map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
});

(function($) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var LatLngvar=new google.maps.LatLng(position.coords.latitude, position.coords.longitude, true);
      $('#starting_location_latitude').val(position.coords.latitude);
      $('#starting_location_longitude').val(position.coords.longitude);
      $('#starting_location_address').hide().after('<p>Using your current location</p>');
    }, function(error) {
      //alert( JSON.stringify(error) );
    }, { enableHighAccuracy: true, maximumAge: 30000, timeout: 27000 });
  } else {
    //alert("No browser geolocation allowed!");
  }
})(jQuery);
