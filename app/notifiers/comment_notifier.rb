# To deliver this notification:
#
# CommentNotifier.with(record: @post, message: "New post").deliver(User.all)

# TODO: Need to sort Notified out properly.
class CommentNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message

  # TODO: Maybe not needed.
  def message
    @post = Post.find(params[:comment][:post_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)
    "#{@user.email} commented on #{@post.title.truncate(10)}"
  end

  # TODO: Maybe not needed.
  def url
    post_path(Post.find(params[:comment][:post_id]))
  end
end
