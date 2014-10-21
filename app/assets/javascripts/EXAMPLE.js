var map;

  function initialize() {
    if(navigator.geolocation) {
      success = function(position) {
        createMap(position.coords.latitude, position.coords.longitude);
      };
      error = function() { createMap(12.659493, 79.415412); }

      navigator.geolocation.getCurrentPosition(success, error);
    }
    else {
      createMap(12.659493, 79.415412);
    }
  }

  function createMap(lat, lng) {
    var mapOptions = { center: new google.maps.LatLng(lat, lng),
      zoom: 12,
      scrollwheel: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP };
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  }
