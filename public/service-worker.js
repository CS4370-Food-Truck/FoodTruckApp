function onPush(event) {
    let title = (event.data && event.data.text()) || "Yay a message";

    event.waitUntil(
        self.registration.showNotification(title, {
            body: "Trucks are arriving!",
            icon: "/assets/path/to/icon.png",
            tag:  "push-simple-demo-notification-tag"
        })
    );
}

self.addEventListener("push", onPush);