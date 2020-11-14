# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  has_many :books, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following
  has_one_attached :avatar
  attr_accessor :current_password

  def follow(user_id)
    active_relationships.create(follower_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by(follower_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.find_for_github_oauth(auth, _signed_in_resource = nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
