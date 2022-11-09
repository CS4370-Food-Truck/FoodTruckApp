function registerServiceWorker() {
    return navigator.serviceWorker
        .register('/service-worker.js')
        .then(function (registration) {
            console.log('Service worker successfully registered.');
            return registration;
        })
        .catch(function (err) {
            console.error('Unable to register service worker.', err);
        });
}

function requestPermission() {
    //Need to check for callback version and promise version
    return new Promise(function (resolve, reject) {
        const permissionResult = Notification.requestPermission(function (result) {
            resolve(result);
        });

        if (permissionResult) {
            permissionResult.then(resolve, reject);
        }
    }).then(function (permissionResult) {
        if (permissionResult !== 'granted') {
            throw new Error('No permission for Notification');
        }
    });
}

function subscribeUserToPush() {
    return navigator.serviceWorker
        .register('/service-worker.js')
        .then(function (registration) {
            const subscribeOptions = {
                userVisibleOnly: true,
                applicationServerKey: urlBase64ToUint8Array(
                    //TODO: Make user get public key from a file on the website instead of hardcoding it.
                    'BGHb-4XS05am7kxb_C_vCS_9-0XKjQdukAyYNduNGT73m4Spw7CBllMV04-b87cx7q1-Z3eLiWLv-CT5-q634uk',
                ),
            };

            return registration.pushManager.subscribe(subscribeOptions);
        })
        .then(function (pushSubscription) {
            console.log(
                'Received PushSubscription: ',
                JSON.stringify(pushSubscription),
            );
            return pushSubscription;
        });
}

function subscriptionAndTrucks(subscription) {
    let url = window.location.href;
    let fixedSubscription = JSON.parse(JSON.stringify(subscription));
    fixedSubscription["trucks"] = " " + url.substring(url.lastIndexOf('/') + 1) + " ";
    return fixedSubscription;
}

function sendSubscriptionToBackEnd(subscription) {
    return fetch('/save-subscription/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(subscriptionAndTrucks(subscription)),
    })
        .then(function (response) {
            if (!response.ok) {
                throw new Error('Bad status code from server.');
            }
            return response.json();
        })
        .then(function (responseData) {
            if (!(responseData.data && responseData.data.success)) {
                throw new Error('Bad response from server.');
            }
        });
}

function updateSubscriptionOnBackEnd(subscription) {
    return fetch('/add-subscription/', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(subscriptionAndTrucks(subscription)),
    })
        .then(function (response) {
            if (!response.ok) {
                throw new Error('Bad status code from server.');
            }
            return response.json();
        })
        .then(function (responseData) {
            if (!(responseData.data && responseData.data.success)) {
                throw new Error('Bad response from server.');
            }
        });
}

function testCompatability() {
    if (!('serviceWorker' in navigator)) {
        throw new Error('No Service Worker support!');
    }

    if (!('PushManager' in window)) {
        throw new Error('No Push API Support!');
    }
    return true;
}

function urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - (base64String.length % 4)) % 4);
    const base64 = (base64String + padding)
        .replace(/\-/g, '+')
        .replace(/_/g, '/');

    const rawData = window.atob(base64);
    const outputArray = new Uint8Array(rawData.length);

    for (let i = 0; i < rawData.length; ++i) {
        outputArray[i] = rawData.charCodeAt(i);
    }
    return outputArray;
}

function checkForSubscription(){
    return navigator.serviceWorker.ready
        .then((serviceWorkerRegistration) => {return serviceWorkerRegistration.pushManager.getSubscription()})
        .then((subscription) => {
            return subscription
        })
}

if (testCompatability() === true){
    //TODO: Create the subscribe, unsubscribe, buttons somewhere on the path.
    if (!checkForSubscription()){
        console.log("No subscription data found.")
        requestPermission().then(registerServiceWorker)
        subscribeUserToPush().then(sendSubscriptionToBackEnd);
    } else {
        console.log("Subscription found for user.")
        //This is where we would want to create buttons for subscribing/unsubscribing from this truck. Also unsub all.
        requestPermission().then(registerServiceWorker)
        checkForSubscription().then(updateSubscriptionOnBackEnd)
    }
}