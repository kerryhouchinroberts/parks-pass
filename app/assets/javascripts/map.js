$(document).ready(function() {
  var map;

  function initialize() {
    var mapOptions = {
      zoom: 3,
      center: new google.maps.LatLng(45.8056897,-150.5219935,8323067),
      mapTypeId: google.maps.MapTypeId.SATELLITE
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
        }

  google.maps.event.addDomListener(window, 'load', initialize);

});
