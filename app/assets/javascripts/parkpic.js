function getBackgroundImage(){
  var parkName = $('.container > h1').text().split(' National')[0];
  $.ajax({
    data: {name: parkName},
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
    type: 'post',
    url: "/parks/parkname"
    })
    .done(function(data){
      $("#park-image").css("background-image", "url("+ data.dropbox +")");
  });
}
