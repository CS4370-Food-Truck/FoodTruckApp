import trucksJson from '/trucks.json' assert {type: 'json'};

function initMap() {
    const msu = { lat: 39.743057, lng: -105.005554 };
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: msu,
    });

    //array used for closing infowindow
    let InforObj = [];

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
            //calls function to close infowindow
            closeOtherInfo();
            infoWindow.open({
                anchor: marker,
                map,
                shouldFocus: false,
            });
            //Places infowindow in array to keep track of which one is open
            InforObj[0] = infoWindow;
        });
    }
    //function checks array, if infowindow is found it is closed
    function closeOtherInfo() {
        if (InforObj.length > 0) {
            InforObj[0].set("marker", null);
            InforObj[0].close();
            InforObj.length = 0;
        }
    }


}

window.initMap = initMap;