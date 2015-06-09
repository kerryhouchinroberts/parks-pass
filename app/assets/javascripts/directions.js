$(function(){
  function initialize() {
    if(navigator.geolocation){
      navigator.geolocation.getCurrentPosition(function(position){
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        var coords = new google.maps.LatLng(latitude, longitude);
        var dest = $("#park-directions-name").text();
        var directionsService = new google.maps.DirectionsService();
        var directionsDisplay = new google.maps.DirectionsRenderer();
        var dirPanel = document.getElementById("directionsPanel");
        var mapOptions = {
          zoom:7,
          center: coords,
          navigationControlOptions:
          {
            style: google.maps.NavigationControlStyle.SMALL
          },
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };


        map = new google.maps.Map(document.getElementById("directions-canvas"),mapOptions);
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(dirPanel);

        var request = {
          origin: coords,
          destination: dest,
          travelMode: google.maps.DirectionsTravelMode.DRIVING,
          provideRouteAlternatives: false
        };

          directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            console.log(response, status);
            directionsDisplay.setDirections(response);
          }
          else if (status === "ZERO_RESULTS"){
            console.log(response, status);
            var content = document.createTextNode("Sorry, driving directions are not available from your location. Try taking a plane.");
            dirPanel.appendChild(content);
          }
        });
      });
    }
  }
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    initialize();
  });
});
