import trucksJson from '/trucks.json' assert {type: 'json'};

function weekDayToString(day){
    switch (day){
        case 0:
            return "Sunday";
        case 1:
            return "Monday";
        case 2:
            return "Tuesday";
        case 3:
            return "Wednesday";
        case 4:
            return "Thursday";
        case 5:
            return "Friday";
        case 6:
            return "Saturday";
    }
}

function initMap() {
    const msu = {lat: 39.743057, lng: -105.005554};
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: msu,
    });

    //array used for closing infowindow
    let InforObj = [];

    for (let i = 0; i < trucksJson.length; i++) {
        let truck = trucksJson[i];
        let textContent =
            '<h1>' + truck.name + '</h1>' +
            '<a href=">' + truck.website + '">Truck Website</a>'
        ;
        let infoWindow = new google.maps.InfoWindow({
            content: textContent
        });

        try {
            let schedule = JSON.parse(truck.schedule);
            let date = new Date();
            let weekday = date.getDay();
            if (schedule.hasOwnProperty(weekDayToString(weekday))) {
                if (schedule[weekDayToString(weekday)] === true) {
                    let marker = new google.maps.Marker({
                        position: {lat: parseFloat(truck.latitude), lng: parseFloat(truck.longitude)},
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
            }
        } catch (e) {
            console.log(e);
            console.log(truck.name);
        }
    }

    //function checks array, if infowindow is found it is closed
    function closeOtherInfo() {
        if (InforObj.length > 0) {
            InforObj[0].set("marker", null);
            InforObj[0].close();
            InforObj.length = 0;
        }
    }

    let infoWindow = new google.maps.InfoWindow();
    const locationButton = document.createElement("button");

    //adds button to find user location
    locationButton.textContent = "Pan to Current Location";
    locationButton.classList.add("custom-map-control-button");
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);

    locationButton.addEventListener("click", () => {
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    const pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    };

                    infoWindow.setPosition(pos);
                    infoWindow.setContent("Location found.");
                    infoWindow.open(map);
                    map.setCenter(pos);
                },
                () => {
                    handleLocationError(true, infoWindow, map.getCenter());
                }
            );
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }
    });

    //directions
    const directionsService = new google.maps.DirectionsService();

    directionsService.route(
        {
            //origin: "272 Bronson Ave, Ottawa, Canada",
            origin:"855 Lawrence Way, Denver, CO 80204",
            //destination: "1385 Woodroffe Ave, Nepean, Canada",
            destination: "5th St, Denver, CO 80204",
            //travelMode: "DRIVING",
            travelMode: "WALKING",
        },
        (response, status) => {
            if (status === "OK") {

                new google.maps.DirectionsRenderer({
                    suppressMarkers: true,
                    directions: response,
                    map: map,
                });
            }
        })



}
window.initMap = initMap;