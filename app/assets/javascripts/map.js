$(document).ready(function () {
    function initialize() {
      var mapOptions = {
        center: { lat: 39.7496354, lng: -105.0001058},
        zoom: 16
      };
      var map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
});
