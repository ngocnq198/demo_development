class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  scope :create_at, -> {order("created_at DESC")}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: Settings.microposts.content.max_length}
  validates :content, presence: true, length: {minimum: Settings.microposts.content.min_length, maximum: Settings.microposts.content.max_length}
end
