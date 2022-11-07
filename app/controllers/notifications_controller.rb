class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Security is not so important here because this is not user-specific, and even if we
  # were to verify the authenticity token, that doesn't stop any of the possible exploits.

  def subscribe
    @subscription = PushSubscription.new({"subscription" => request.body.read})
    if @subscription.save
      redirect_to(trucks_path)
    else
      render 'new'
    end
  end

end