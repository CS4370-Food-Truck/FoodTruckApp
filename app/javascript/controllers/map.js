import trucksJson from '/trucks.json' assert {type: 'json'};
var map;

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

//don't worry about this, I might use it later, if not I'll delete - Arturo
//infoWindow.setContent("<div>" + truck.name + "<br><input type='submit' id='butSubmit' value='Procurar' onclick='dicDic()'><div id='bar'></div></div>");



function initMap() {
    const msu = {lat: 39.743057, lng: -105.005554};
    map = new google.maps.Map(document.getElementById("map"), {
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

                    marker.addListener("dblclick", () => {

                        getDirections(marker.position)

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

    function success(position){
        const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
        };

        infoWindow.setPosition(pos);
        infoWindow.setContent("Location found.");
        infoWindow.open(map);
        map.setCenter(pos);
        console.log(pos)
    }

    locationButton.addEventListener("click", () => {
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(

                (position) => {
                    success(position)

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

    /* Might use this later, will delete if I don't
        //adds button for directions

        const dicButton = document.createElement("button");
        dicButton.textContent = "Directions";
        dicButton.classList.add("custom-map-control-button");
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(dicButton);

        dicButton.addEventListener("click", () => {

            console.log("hereeeeeeeeeeeee")
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(locationSuccess, locationError);
            }
            else {
                alert("Geolocation not supported");
            }
            console.log("now hereeeeeeeeeeeee")

        });
    */
}

function getDirections(end) {
    console.log("position: " + end)
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(

            (position) => {
                var directionsService = new google.maps.DirectionsService();
                var directionsDisplay = new google.maps.DirectionsRenderer();

                var myLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                var truckLocation = new google.maps.LatLng(end);

                directionsDisplay.setMap(map);

                var request = {
                    origin: myLocation,
                    destination: truckLocation,
                    travelMode: 'WALKING'
                };

                directionsService.route(request, function (result, status) {
                    if (status == google.maps.DirectionsStatus.OK)
                        directionsDisplay.setDirections(result);
                });

            },

            () => {
                handleLocationError(true, infoWindow, map.getCenter());
            }
        );
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

/*
function locationSuccess(position) {

    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();

    var myLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    var truckLocation = new google.maps.LatLng(39.741462, -105.009659);

    directionsDisplay.setMap(map);

    var request = {
        origin: myLocation,
        destination: truckLocation,
        travelMode: 'WALKING'
    };

    directionsService.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK)
            directionsDisplay.setDirections(result);
    });

}

function locationError() {
    alert("Couldn't get location");
}
*/


window.initMap = initMap;