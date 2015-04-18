'use strict';
(function(ns){

  ns = ns || {};
  ns.google = ns.google || {
    buildAddress: function(slices){
        var formattedAddress = {
            street: '',
            number: '',
            postCode: '',
            locality: ''
        },
        returnAddress = [];

        for (var slice in slices){
            var thisSlice = slices[slice],
            thisTypes = thisSlice.types;

            if (thisTypes.indexOf('route') >=  0){
                formattedAddress['street'] = thisSlice.long_name;
            }
            if (thisTypes.indexOf('street_number') >=  0){
                formattedAddress['number'] = thisSlice.long_name;
            }
            if (thisTypes.indexOf('postal_code') >=  0){
                formattedAddress['postCode'] = thisSlice.long_name;
            }
            if (thisTypes.indexOf('locality') >=  0){
                formattedAddress['locality'] = thisSlice.long_name;
            }
        }

        for (var element in formattedAddress){
            if(formattedAddress[element])
                returnAddress.push(formattedAddress[element]);
        }

        return returnAddress.join(',');
  },

  search: function(address, callback){
    $.ajax({
        url: 'https://maps.googleapis.com/maps/api/geocode/json?',
        data: {
            address: address,
            bounds: '43.800184,-9.556995|35.858116,3.391955',
            sensor: false,
            language: 'es',
            // components: 'country: Spain'
        },
        timeout: 1000
    }).success(function(data){
      console.log(data);
      var response = data;
      if (response != null && response.status === 'OK'){
          var res = [];
          $(response.results).each(function(element){
            console.log(this);

            var point = {
                pos:[
                    this.geometry.location.lat,
                    this.geometry.location.lng
                ],
                address: this.address_components,
            };
            callback(point);
          });
      }
    });
  },

  addMarker: function(point){
    console.log(point);
    var latLng = L.latLng(point.pos);

    var thisMarker = new L.Marker(latLng, {draggable: true});
    thisMarker.on('dragend', function(event){
      ns.lastPosition = event.target._latlng;
      $('.lat').val(ns.lastPosition.lat);
      $('.lng').val(ns.lastPosition.lng);
    }).fire('dragend');
    // new L.PopUp()

    thisMarker.addTo(ns.featureGroup);
  },

  clearMap: function(){
    if (ns.featureGroup)
      ns.map.removeLayer(ns.featureGroup);
    ns.featureGroup = new L.featureGroup();
    ns.featureGroup.addTo(ns.map);

    ns.featureGroup.on('layeradd', function(){
      console.log(arguments);
      ns.map.fitBounds(ns.featureGroup.getBounds(), {maxZoom: 14});
    });
  },

  addPlace: function(address){
    ns.google.search(address, this.addMarker);
  }
  };

  return ns;
})(ESPIGOLADORS);
