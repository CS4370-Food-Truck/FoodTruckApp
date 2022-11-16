import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trucks--show"
export default class extends Controller {
  connect() {
    //Code created with some reference from: https://web.dev/push-notifications-subscribing-a-user/

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
                  'BJ-M85-rL_cR-YOb1tFTiz9BRyss0bEdrjxssfhUqZcnvHsSOABWVZs-zJ8_qYN_sE2AxbFXgSVY6LiyLBg9GyA',
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
            location.reload();
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
            location.reload();
          });
    }

    function removePartialSubscriptionOnBackEnd(subscription) {
      return fetch('/remove-subscription/', {
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
            location.reload();
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
            console.log(subscription)
            return subscription
          })
    }

    function unsubscribeUser(subscription){
      return fetch('/unsubscribe/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(subscription),
      })
          .then(function (response) {
            if (!response.ok) {
              throw new Error('Bad status code from server.');
            }
            subscription.unsubscribe();
            location.reload();
          });
    }

    function showButtons(givenSubscription) {
      if (!givenSubscription) {
        console.log("No subscription data found.")
        let button = document.createElement("button");
        button.innerHTML = "Subscribe to notifications for this truck";
        button.onclick = function () {
          subscribeUserToPush().then(sendSubscriptionToBackEnd);
        }
        document.body.appendChild(button);
      } else {
        console.log("Subscription found for user.")
        let subscribeTruck = document.createElement("button");
        subscribeTruck.innerHTML = "Add truck to your notifications";
        subscribeTruck.onclick = function () {
          checkForSubscription().then(updateSubscriptionOnBackEnd);
        }
        document.body.appendChild(subscribeTruck);

        let unsubscribeTruck = document.createElement("button");
        unsubscribeTruck.innerHTML = "Remove truck from your notifications";
        unsubscribeTruck.onclick = function () {
          checkForSubscription().then(removePartialSubscriptionOnBackEnd);
        }
        document.body.appendChild(unsubscribeTruck);

        let unsubscribeAll = document.createElement("button");
        unsubscribeAll.innerHTML = "Unsubscribe from all trucks";
        unsubscribeAll.onclick = function () {
          checkForSubscription().then(unsubscribeUser);
        }
        document.body.appendChild(unsubscribeAll);
      }
    }


    if (testCompatability() === true){
      let notificationsButton = document.createElement("button");
      notificationsButton.innerHTML = "Open Notification Controls";
      notificationsButton.onclick = function () {
        document.body.removeChild(notificationsButton)
        requestPermission().then(registerServiceWorker).then(checkForSubscription).then(showButtons)
      }
      document.body.appendChild(notificationsButton)
    }
  }
}
