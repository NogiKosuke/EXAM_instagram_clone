class Picture < ApplicationRecord
  validates :picture, presence: true
  validates :content, presence: true
  mount_uploader :picture, PictureUploader
  has_many :favorites, dependent: :destroy
  belongs_to :user
end
