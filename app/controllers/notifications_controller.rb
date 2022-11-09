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
    #Customer.where(first_name: 'Lifo').take
  end
  def unsubtruck
    #Customer.where(first_name: 'Lifo').take
  end
  def unsubscribe
    #Customer.where(first_name: 'Lifo').take
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
          exp:13.hours
        }
      )
    end
    redirect_to(trucks_path)
  end

end