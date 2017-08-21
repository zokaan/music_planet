class Album < ApplicationRecord

  belongs_to :user
  has_many :songs

  mount_uploader :image, ImageUploader

  scope :last_added_first, -> { order(created_at: :desc) }
end
