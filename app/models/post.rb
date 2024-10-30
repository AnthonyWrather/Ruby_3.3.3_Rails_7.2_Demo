class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 3, maximum: 1000 }
  belongs_to :user
  has_many :comments, dependent: :destroy

  # TODO: May not be needed in the latest version of noticed?
  # TODO: Need to sort Notified out properly.
  has_noticed_notifications model_name: "Notification"
  has_many :notifications, through: :user, dependent: :destroy
end
