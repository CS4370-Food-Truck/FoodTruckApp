import trucksJson from '/trucks.json' assert {type: 'json'};

// Initialize and add the map
function initMap() {
    // The location of Uluru
    const uluru = { lat: 39.743057, lng: -105.005554 };
    // The map, centered at Uluru
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: uluru,
    });
    // The marker, positioned at Uluru
    const marker = new google.maps.Marker({
        position: uluru,
        map: map,
    });
}

window.initMap = initMap;