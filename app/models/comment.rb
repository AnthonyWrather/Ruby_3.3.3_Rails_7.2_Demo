class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body

  # TODO: May not be needed in the latest version of noticed?
  # TODO: Need to sort Notified out properly.
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: "Notification"
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"

  private

  def notify_recipient
    # TODO: Need to sort Notified out properly.
    # TODO: Need to sort Notified out properly.
    CommentNotifier.with(comment: self, post: post).deliver(post.user)
    # @current_user.notifications.with(comment: self, post: post).deliver_later(post.user)
    # CommentNotificationNotifier.with().deliver_later()
    # CommentNotifier.with().deliver_later()
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
