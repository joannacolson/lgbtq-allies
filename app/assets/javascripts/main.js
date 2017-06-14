$(document).ready(function() {
    console.log('jquery connected');
    $('.collapse').collapse()

    //Google Maps with many markers
    console.log(JSON.parse(places));
    var handler = Gmaps.build('Google');
    handler.buildMap({ internal: { id: 'multi_markers' } }, function() {
        var markers = handler.addMarkers(JSON.parse(places));
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    });
});
