class Picture < ApplicationRecord
  validates :picture, presence: true
  validates :content, presence: true
  belongs_to :user
end
