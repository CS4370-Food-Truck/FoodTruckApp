import trucksJson from '/trucks.json' assert {type: 'json'};

function initMap() {
    const msu = { lat: 39.743057, lng: -105.005554 };
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: msu,
    });

    const marker = new google.maps.Marker({
        position: msu,
        map: map,
    });
}

window.initMap = initMap;