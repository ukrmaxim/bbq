document.addEventListener('DOMContentLoaded', function() {
    ymaps.ready(init);
    let map = document.getElementById('map')
    function init(){
        if (!map) { return }
        let address = map.getAttribute('data-address');
        let myMap = new ymaps.Map("map", {
           center: [49.9935, 36.23038],
           zoom: 10
        });
        myGeocoder = ymaps.geocode(address);
        myGeocoder.then(
            function (res) {
                coordinates = res.geoObjects.get(0).geometry.getCoordinates();
                myMap.geoObjects.add(
                    new ymaps.Placemark(
                        coordinates,
                        {iconContent: address},
                        {preset: 'islands#blueStretchyIcon'}
                    )
                );
                myMap.setCenter(coordinates);
                myMap.setZoom(15);
            },
            function (err) {
                alert('Ошибка при определении местоположения');
            }
        );

    }
})
