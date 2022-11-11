class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Security is not so important here because this is not user-specific, and even if we
  # were to verify the authenticity token, that doesn't stop any of the possible exploits.

  def subscribe
    @subscription = PushSubscription.new(JSON.parse(request.body.read))
    if @subscription.save
      redirect_to(trucks_path)
    else
      render 'new'
    end
  end

  def subtruck
    receivedsubscription = JSON.parse(request.body.read)
    url = receivedsubscription['endpoint']
    @subscription = PushSubscription.where(endpoint: url).first

    if @subscription.trucks.index(receivedsubscription['trucks'])
      puts("We are already subscribed to that truck.")
    else
      newtrucks = @subscription.trucks + receivedsubscription['trucks']
      PushSubscription.where(endpoint: url).update_all(trucks: newtrucks)
    end
    redirect_to(trucks_path)
  end
  def unsubtruck
    receivedsubscription = JSON.parse(request.body.read)
    url = receivedsubscription['endpoint']
    @subscription = PushSubscription.where(endpoint: url).first

    if @subscription.trucks.index(receivedsubscription['trucks'])
      newtrucks = @subscription.trucks
      newtrucks.slice!(receivedsubscription['trucks'])
      PushSubscription.where(endpoint: url).update_all(trucks: newtrucks)
    else
      puts("We are not subscribed to that truck.")
    end
    redirect_to(trucks_path)
  end
  def unsubscribe
    receivedsubscription = JSON.parse(request.body.read)
    url = receivedsubscription['endpoint']
    @subscription = PushSubscription.where(endpoint: url).first
    @subscription.destroy

    redirect_to(trucks_path)
  end
  def notify
    @subscription = PushSubscription.all
    @subscription.each do |subscription|

      Webpush.payload_send(
        message: "Testing notification",
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
    redirect_to(trucks_path)
  end

end