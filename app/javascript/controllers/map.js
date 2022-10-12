import trucksJson from '/trucks.json' assert {type: 'json'};

function initMap() {
    const msu = { lat: 39.743057, lng: -105.005554 };
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: msu,
    });

    for(let i = 0; i < trucksJson.length; i++){
        let truck = trucksJson[i];
        let textContent =
            '<h1>' + truck.name + '</h1>' +
            '<a href=">' + truck.website + '">Truck Website</a>'
        ;
        let infoWindow = new google.maps.InfoWindow({
            content: textContent
        });
        let marker = new google.maps.Marker({
            position: { lat: parseFloat(truck.latitude), lng: parseFloat(truck.longitude) },
            map: map,
        });
        marker.addListener("click", () => {
            infoWindow.open({
                anchor: marker,
                map,
                shouldFocus: false,
            });
        });
    }

}

window.initMap = initMap;