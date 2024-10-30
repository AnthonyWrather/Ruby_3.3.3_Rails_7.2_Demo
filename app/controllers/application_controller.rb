class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def set_notifications
    # TODO: Need to sort Notified out properly.
    # @unread = Notification.where(recipient: current_user).newest_first.limit(9).unread
    # @notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    # @notifications = Noticed.where(recipient: current_user).newest_first.limit(9)
    @notifications = @current_user.notifications.where(recipient: current_user).newest_first.limit(9)
    @unread = @notifications.unread
    @read = @notifications.read
  end
end
