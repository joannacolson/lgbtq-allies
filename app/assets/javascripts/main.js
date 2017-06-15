$(document).ready(function() {
    console.log('jquery connected');
    $('.collapse').collapse();

    $("#alerts").fadeTo(3000, 500).slideUp(500, function() {
        $("#alerts").slideUp(500);
    });

    // Moved this logic to the index page to prevent execution on all pages in main.js
    //Google Maps with many markers
    // console.log(JSON.parse(places));
    // var handler = Gmaps.build('Google');
    // handler.buildMap({ internal: { id: 'multi_markers' } }, function() {
    //     var markers = handler.addMarkers(JSON.parse(places));
    //     handler.bounds.extendWith(markers);
    //     handler.fitMapToBounds();
    // });
});
