'use strict';
var _randomPoint = function(top_left, bottom_right){
  return [
    top_left[0] + Math.random() * (bottom_right[0] - top_left[0]),
    top_left[1] + Math.random() * (bottom_right[1] - top_left[1])
  ];
};


var _addRandomPoints = function (howMuch, map){
  var topLeft = [0,0];
  var rightBottom = [5,5];

  var allMarkers = new L.featureGroup();

  for (var i=0; i<howMuch; i++){
    var currentPoint = new L.Marker(_randomPoint([-90,-180], [90,180]));
    console.log(currentPoint);
    currentPoint.addTo(allMarkers)
  }
  console.log(allMarkers.getBounds());
  allMarkers.addTo(map);
  map.fitBounds(allMarkers.getBounds());
};

var _addMarkerFromAddress = function(address){
  ESPIGOLADORS.google.clearMap();
  ESPIGOLADORS.google.addPlace(address);
};

$(function(){
  // if (!$('#mapa').length)
  //   return;

  $(window).on('resize',function(){
      $('#mapa').height(
        Math.min(
          $('#mapa').width()*.50,
          $(window).height()
        )
      );
  }).trigger('resize');

  ESPIGOLADORS.map = L.map('mapa');

  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(ESPIGOLADORS.map);

  ESPIGOLADORS.map.setView([40.25, -3.41], 5);

  $('button.search').click(function(event){
    var address = $('div .address').val();
    $('div .refine').val($('div .address').val());
    _addMarkerFromAddress(address);
    event.preventDefault();
  });

  $('button.submit').click(function(event){
    console.log(ESPIGOLADORS.lastPosition);
    event.preventDefault();
  });

  $('.refine').on('input', function(event){

    console.log($(event.target).val());

    var address = $('div .refine').val();
    _addMarkerFromAddress(address);
    event.preventDefault();
  }).trigger('input');

});
