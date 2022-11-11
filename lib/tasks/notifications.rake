namespace :notifications do
  desc "Notify users of which of their favorite trucks will be available today."
  task notify: :environment do
    DAYNAMES = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
    subscriptions = PushSubscription.all
    truckstoday = ""
    subscriptions.each do |subscription|
      truckstocheck = subscription.trucks.split("  ")
      truckstocheck.each do |truck|
        truckid = truck.strip
        entry = Truck.find(truckid)
        schedule = JSON.parse(entry.schedule)
        today = DAYNAMES[Date.today.wday]
        if schedule[today] == true
          truckstoday = truckstoday + entry.name + ", "
        end
      end

      if truckstoday.length > 0
        Webpush.payload_send(
          message: "Food trucks are arriving today: " + truckstoday,
          endpoint: subscription.endpoint,
          auth: subscription.keys['auth'],
          p256dh: subscription.keys['p256dh'],
          vapid: {
            subject: "Subject.",
            public_key: Figaro.env.NOTIFY_PUBLIC,
            private_key: Figaro.env.NOTIFY_PRIVATE,
            expiration:13.hours
          }
        )
      end
    end
  end

end
