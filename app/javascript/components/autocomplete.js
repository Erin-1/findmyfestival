function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var festivalAddress = document.getElementById('festival_address');


    if (festivalAddress) {
      var autocomplete = new google.maps.places.Autocomplete(festivalAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(festivalAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
