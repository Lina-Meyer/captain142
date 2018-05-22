// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let boatAddress = document.getElementById('boat_city');

    if (boatAddress) {
      let autocomplete = new google.maps.places.Autocomplete(boatAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(boatAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
