
function onPlaceChanged() {
  var place = this.getPlace();

  console.log(place);  // Uncomment this line to view the full object returned by Google API.

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
      var type_element = document.getElementById(component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
    }
  }
}


document.addEventListener("DOMContentLoaded", function() {
  var tripStartAddress = document.getElementById('trip_start_address');

  if (tripStartAddress) {
    var autocomplete = new google.maps.places.Autocomplete(tripStartAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(tripStartAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});


document.addEventListener("DOMContentLoaded", function() {
  var tripDestinationAddress = document.getElementById('trip_destination_address');

  if (tripDestinationAddress) {
    var autocomplete = new google.maps.places.Autocomplete(tripDestinationAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(tripDestinationAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

// function initializeAutocomplete(id) {
//   var element = document.getElementById(id);
//   console.log(element);
//   if (element) {
//     var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
//   }
// }


// google.maps.event.addDomListener(window, 'load', function() {
//   initializeAutocomplete('trip_start_address');
// });

// function onPlaceChanged() {
//   var place = this.getPlace();
//   var components = getAddressComponents(place);

//   var tripAddress = document.querySelector('.autocomplete-address');
//   var tripAddressTest = document.querySelector('.autocomplete-address-test');
//   tripAddress.blur();
//   tripAddress.value = components.address;
//   tripAddressTest.blur();
//   tripAddressTest.value = components.address;

  // document.getElementById('trip_zip_code').value = components.zip_code;
  // document.getElementById('trip_city').value = components.city;

  // if (components.country_code) {
  //   var selector = '#trip_country option[value="' + components.country_code + '"]';
  //   document.querySelector(selector).selected = true;
  // }
// }


// function getAddressComponents(place) {
//   // If you want lat/lng, you can look at:
//   // - place.geometry.location.lat()
//   // - place.geometry.location.lng()

//   if (window.console && typeof console.log === "function") {
//     console.log(place);
//   }

//   var street_number = null;
//   var route = null;
//   var zip_code = null;
//   var city = null;
//   var country_code = null;
//   for (var i in place.address_components) {
//     var component = place.address_components[i];
//     for (var j in component.types) {
//       var type = component.types[j];
//       if (type === 'street_number') {
//         street_number = component.long_name;
//       } else if (type === 'route') {
//         route = component.long_name;
//       } else if (type === 'postal_code') {
//         zip_code = component.long_name;
//       } else if (type === 'locality') {
//         city = component.long_name;
//       } else if (type === 'postal_town' && city === null) {
//         city = component.long_name;
//       } else if (type === 'country') {
//         country_code = component.short_name;
//       }
//     }
//   }

//   return {
//     address: street_number === null ? route : (street_number + ' ' + route),
//     zip_code: zip_code,
//     city: city,
//     country_code: country_code
//   };
// }

// document.addEventListener("DOMContentLoaded", function() {
//   var tripAddress = document.querySelector('.autocomplete-address');

//   if (tripAddress) {
//     var autocomplete = new google.maps.places.Autocomplete(tripAddress, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
//     google.maps.event.addDomListener(tripAddress, 'keydown', function(e) {
//       if (e.key === "Enter") {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }
// });

// document.addEventListener("DOMContentLoaded", function() {
//   var tripAddressTest = document.querySelector('.autocomplete-address-test');

//   if (tripAddressTest) {
//     var autocompletetest = new google.maps.places.Autocomplete(tripAddressTest, { types: ['geocode'] });
//     google.maps.event.addListener(autocompletetest, 'place_changed', onPlaceChanged);
//     google.maps.event.addDomListener(tripAddressTest, 'keydown', function(e) {
//       if (e.key === "Enter") {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }
// });
