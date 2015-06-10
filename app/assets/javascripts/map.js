$(document).ready(function() {
  var map;
  resizeMapModal();


  function initialize() {
    var myLatlng = new google.maps.LatLng(45.8056897,-100.5219935);
    var mapOptions = {
      scrollwheel: false,
      minZoom: 2,
      zoom: 3,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.SATELLITE
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    getParks();

    function getParks(){
      $.ajax({
        url: "/parks",
        type: "get"
      }).done(function(data){
        var counter = data.length;
        var map = map;
        for (var i=0; i < counter; i++) {
          lat = data[i].latitude;
          lng = data[i].longitude;
          title = data[i].name;
          id = data[i].id;
          setMarker(lat, lng, title, id);
        }
      });
    }

    function setMarker(lat, lng, title, id) {
      pos = new google.maps.LatLng(lat,lng);
      var image = 'http://cdn.flaticon.com/png/32/8070.png';
      var marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: title,
        id: id,
        icon: image
      });

      google.maps.event.addListener(marker, 'click', function(){window.location = '/parks/' + marker.id;});
    }

    $("#map-canvas").one('mousemove', function () {
      var currentCenter = map.getCenter();
      google.maps.event.trigger(map, "resize");
      map.setCenter(currentCenter);
    });


  }


  google.maps.event.addDomListener(window, 'load', initialize);

});

function resizeMapModal(){
  $('#map-canvas').on('shown.bs.modal', function(e){
    alert("modal open");
    var currentCenter = map.getCenter();
    google.maps.event.trigger(map, "resize");
    map.setCenter(currentCenter);
  });
}
