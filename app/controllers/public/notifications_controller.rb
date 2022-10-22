class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_customer.passive_notifications.page(params[:page]).per(20)
    # @notifications.map do |notification|
      # notification.update_attribute(checked: true)
    # end
    @notifications.where(checked: false).each do |notification|
      notification.update_attribute("checked", true)

    end
  end
end