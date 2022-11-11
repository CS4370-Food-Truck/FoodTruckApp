namespace :notifications do
  desc "Notify users of which of their favorite trucks will be available today."
  task notify: :environment do
    subscriptions = PushSubscription.all
    puts(subscriptions)
    subscriptions.each do |subscription|
      Webpush.payload_send(
        message: "Testing notification",
        endpoint: subscription.endpoint,
        auth: subscription.keys['auth'],
        p256dh: subscription.keys['p256dh'],
        vapid: {
          subject: "Subject.",
          public_key: Figaro.env.NOTIFY_PUBLIC,
          private_key: Figaro.env.NOTIFY_PRIVATE,
          exp:13.hours
        }
      )
    end
  end

end
