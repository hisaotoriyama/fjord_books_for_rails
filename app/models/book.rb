# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
end
