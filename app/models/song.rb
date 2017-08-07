class Song < ApplicationRecord
  belongs_to :album
  belongs_to :user

  has_many :lists
  has_many :playlists, through: :lists

  scope :last_added_first, -> { order(created_at: :desc) }
end
