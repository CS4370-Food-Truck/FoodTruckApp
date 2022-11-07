class NotificationsController < ApplicationController
  def subscribe
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to(trucks_path)
    else
      render 'new'
    end
  end

end