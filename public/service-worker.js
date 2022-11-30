//Service-worker.js code modified from https://rossta.net/blog/web-push-notifications-from-rails.html
//The article itself contains outdated information and uses gems that I don't use, but its basic service-worker is helpful.

function onPush(event) {
    let title = (event.data && event.data.text()) || "Message"; //Defaults to "Message" if no title.

    event.waitUntil(
        self.registration.showNotification(title, {
            body: "Trucks are arriving!", //Additional description for the notification
            icon: "/assets/path/to/icon.png", //Defaults to chrome icon image.
            tag:  "push-simple-demo-notification-tag" //Not used for our program
        })
    );
}

self.addEventListener("push", onPush);