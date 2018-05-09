class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :comments
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  before_save :email_save
  validates :name, presence: true, length: {maximum: Settings.users.name.max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.users.email.max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.users.password.min_length}, allow_nil: true

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  private
  def email_save
    self.email.downcase!
  end
end
